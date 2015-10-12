<#--
    Intro template: Format the Intro structure
    
    Created:    2015-08-28 17:52 by Christian Berndt
    Modified:   2015-10-12 14:43 by Nils Sanders
    Version:    1.0.0
    
    Please note: Although this template is stored in the 
    site's context it's source is managed via git. Whenever you 
    change the template online make sure that you commit your 
    changes to the flussbad-modules repo, too.
-->
<#assign cssClass = "">
<#assign style = "background: white;">
<#assign hasKeyVisual = false>


<#-- remove with-image when custom.css is updated -->
<#if background??>
    <#if background.getData()?has_content>    
        <#assign cssClass = "with-image" >
        <#assign hasKeyVisual = true>
        <#assign style = "background-image: url('${background.getData()}');" >
    </#if>
</#if>

<#if backgroundColor??>
    <#assign cssClass = "${cssClass}" + " " + "${backgroundColor.getData()}">
</#if>

<div class="intro ${cssClass}">

    <#if hasKeyVisual>
        <div class="keyvisual" style="${style}">
            <div class="claim">
                <div class="row">
                    <div class="span6 offset3">
                        <#if link.getData()?has_content >
                            <a href="${link.getData()}" title="${label.getData()}">
                                <h1>${headline.getData()}</h1>
                            </a>
                        <#else>
                            <h1>${headline.getData()}</h1>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    <#else>
        <div class="claim">
            <div class="row">
                <div class="span6 offset3">
                    <h1>${headline.getData()}</h1>
                </div>
            </div>
        </div>    
    </#if>
    <div class="abstracts">
        <div class="container club-link">
            <div class="span4 offset8">
            </div>
        </div>
        <div class="container">
            <#if caption.getSiblings()?has_content>
                <#assign i = 0 >
                <#list caption.getSiblings() as cur_caption>
                    <#if (i < 3) >                   
                        <div class="span4">
                            <#if cur_caption.getData()?has_content>
                                <div class="abstract">
                                    <#if i==2>
                                        <#if clubLink??>
                                            <#if clubLink.getData()?has_content>
                                                <a class="club-link" href="${clubLink.getData()}" title="${languageUtil.get(locale, "get-involved")}"><span>${languageUtil.get(locale, "get-involved")}</span></a>
                                            </#if>
                                        </#if>
                                    </#if>
                                    <h3>${cur_caption.getData()}</h3>
                                    <h2>${cur_caption.claim.getData()}</h2>
                                    <p>${cur_caption.abstract.getData()}</p>
                                    <#if cur_caption.abstractLink.getData()?has_content>
                                        <div>
                                            <a href="${cur_caption.abstractLink.getData()}" class="btn" title="${cur_caption.abstractLabel.getData()}">${cur_caption.abstractLabel.getData()}</a>
                                        </div>
                                    </#if>
                                </div>
                            </#if>
                        </div>
                        <#assign i = i+1>
                    </#if>
                </#list>
            </#if>
        </div>
    </div>
    <#if link.getData()?has_content && !hasKeyVisual>
        <div class="container link">
            <a href="${link.getData()}" class="btn" title="${label.getData()}">${label.getData()}</a>
        </div>
    </#if>
</div>