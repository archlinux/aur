# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>
# Contributor: Archist archist@die-optimisten.net

# according to https://wiki.archlinux.org/index.php/Web_application_package_guidelines
pkgname=(
	 'kopano-webapp'
	 'kopano-webapp-contactfax'
	 'kopano-webapp-folderwidgets'
	 'kopano-webapp-gmaps'
	 'kopano-webapp-pimfolder'
	 'kopano-webapp-quickitems'
	 'kopano-webapp-titlecounter'
	 'kopano-webapp-webappmanual'
     'kopano-webapp-zdeveloper'

	 # STANDALONE PLUGINS
	         
     'kopano-webapp-files'
#	 'kopano-webapp-filesbackendOwncloud'
#    'kopano-webapp-filesbackendSMB'         
     'kopano-webapp-filepreviewer'
     'kopano-webapp-smime'
	 'kopano-webapp-desktopnotifications'
	 'kopano-webapp-intranet'
	 'kopano-webapp-mdm'
	 'kopano-webapp-spellchecker'
	 'kopano-webapp-spellchecker-languagepack-german-at'
	 'kopano-webapp-spellchecker-languagepack-german-ch'
	 'kopano-webapp-spellchecker-languagepack-german-de'
	 'kopano-webapp-spellchecker-languagepack-english-gb'
	 'kopano-webapp-spellchecker-languagepack-english-us'
	 'kopano-webapp-spellchecker-languagepack-spanish'
	 'kopano-webapp-spellchecker-languagepack-french'
	 'kopano-webapp-spellchecker-languagepack-italian-it'
	 'kopano-webapp-spellchecker-languagepack-dutch'         
	 'kopano-webapp-passwd'
	 'kopano-webapp-fetchmail'
	)
	
replaces=(
	  'zarafa-webapp'
	  'zarafa-webapp-contactfax'
	  'zarafa-webapp-folderwidgets'
	  'zarafa-webapp-gmaps'
	  'zarafa-webapp-pimfolder'
	  'zarafa-webapp-quickitems'
	  'zarafa-webapp-titlecounter'
	  'zarafa-webapp-webappmanual'
	  'zarafa-webapp-zdeveloper'

	  'zarafa-webapp-files'
	  'zarafa-webapp-filepreview'
	  'zarafa-webapp-smime'
	 )

groups=(
	'zarafa'
	'kopano'
	'zarafa-webapp-plugins'
	)

# All versions have to be this way => x.x.x
#
pkgver=3.4.12
pkgrel=1

# Tag doesn't work with arch versioning
_pkgverfiles="2.1.2"
_pkgverfiles_tag="2.1.2-final"
###
_pkgverfilesowncloudbackend="2.0.0"
_pkgverfilessmbbackend="2.0.0"
_pkgverfilepreviewer="2.0.0"
# Tag doesn't work with arch versioning
_pkgversmime="2.2.0"
_pkgversmime_tag="2.2.0-beta.2"
###
_pkgverdesktopnotifications="2.0.1"
_pkgverintranet="1.0.0"
# Tag doesn't work with arch versioning
_pkgvermobiledevicemanagement="2.1.0"
_pkgvermobiledevicemanagement_tag="2.1.0-beta.3"
###
_pkgverspellchecker="2.0.0"
_pkgverpasswd="1.4.1"
_pkgverfetchmail="1.2"


pkgdesc='WebApp for Kopano'
arch=('any')
url='http://www.kopano.com/'
license=('AGPL3')
depends=(
	 'php'
	 'nginx'
	 'php-fpm'
	)
	
makedepends=(
	     'apache-ant'
	     'gettext'
	     'libxml2'
	     'git'
	     )
	     
source=("git+https://stash.kopano.io/scm/kw/kopano-webapp.git#tag=v${pkgver}"
	"nginx-location.conf"
	"nginx-ssl.example.conf"
	"php-fpm.example.conf"
	"kopano-webapp.conf"
	"kopano-webapp.ini"
	"kopano-webapp.install"
	"compress-static"

	# STANDALONE PLUGINS
	
	"kopano-webapp-files::git+https://stash.kopano.io/scm/kwa/files.git#tag=v$_pkgverfiles_tag"
	"kopano-webapp-filesbackendOwncloud::git+https://stash.kopano.io/scm/kwa/files-owncloud-backend.git#tag=v$_pkgverfilesowncloudbackend"
	"kopano-webapp-filesbackendSMB::git+https://stash.kopano.io/scm/kwa/files-smb-backend.git#tag=v$_pkgverfilessmbbackend"
	"kopano-webapp-files.ini"
	"kopano-webapp-filepreviewer::git+https://stash.kopano.io/scm/kwa/filepreviewer.git#tag=v$_pkgverfilepreviewer"
	"kopano-webapp-smime::git+https://stash.kopano.io/scm/kwa/smime.git#tag=v$_pkgversmime_tag"
	"kopano-webapp-smime.ini"		
	"kopano-webapp-desktopnotifications::git+https://stash.kopano.io/scm/kwa/desktopnotifications.git#tag=v$_pkgverdesktopnotifications"
	"kopano-webapp-intranet::git+https://stash.kopano.io/scm/kwa/intranet.git" # No Tags #tag=$_pkgverintranet"
	"kopano-webapp-mdm::git+https://stash.kopano.io/scm/kwa/mobile-device-management.git#tag=v$_pkgvermobiledevicemanagement_tag"
	"kopano-webapp-spellchecker::git+https://stash.kopano.io/scm/kwa/spellchecker.git#tag=v$_pkgverspellchecker"
	"kopano-webapp-spellchecker.ini"
	"kopano-webapp-spellchecker-languagepack-german-at::git+https://stash.kopano.io/scm/kwa/spellchecker-languagepack-de-at.git#tag=v$_pkgverspellchecker"
	"kopano-webapp-spellchecker-languagepack-german-ch::git+https://stash.kopano.io/scm/kwa/spellchecker-languagepack-de-ch.git#tag=v$_pkgverspellchecker"
	"kopano-webapp-spellchecker-languagepack-german-de::git+https://stash.kopano.io/scm/kwa/spellchecker-languagepack-de-de.git#tag=v$_pkgverspellchecker"
	"kopano-webapp-spellchecker-languagepack-english-gb::git+https://stash.kopano.io/scm/kwa/spellchecker-languagepack-en-gb.git#tag=v$_pkgverspellchecker"
	"kopano-webapp-spellchecker-languagepack-english-us::git+https://stash.kopano.io/scm/kwa/spellchecker-languagepack-en-us.git#tag=v$_pkgverspellchecker"
	"kopano-webapp-spellchecker-languagepack-spanish::git+https://stash.kopano.io/scm/kwa/spellchecker-languagepack-es-es.git#tag=v$_pkgverspellchecker"
	"kopano-webapp-spellchecker-languagepack-french::git+https://stash.kopano.io/scm/kwa/spellchecker-languagepack-fr-fr.git#tag=v$_pkgverspellchecker"
	"kopano-webapp-spellchecker-languagepack-italian-it::git+https://stash.kopano.io/scm/kwa/spellchecker-languagepack-italian-it.git" # No Tags #tag=$_pkgverspellchecker"
	"kopano-webapp-spellchecker-languagepack-dutch::git+https://stash.kopano.io/scm/kwa/spellchecker-languagepack-nl.git#tag=v$_pkgverspellchecker"
#	"kopano-webapp-passwd::git+https://github.com/apio-sys/kopano-webapp-passwd.git#tag=v$_pkgverpasswd"
	"kopano-webapp-passwd::git+https://github.com/mpietruschka/kopano-webapp-passwd.git#tag=v$_pkgverpasswd"
#	"kopano-webapp-fetchmail::git+https://github.com/olia-dev/kopano-webapp-fetchmail#tag=$_pkgverfetchmail"
	"kopano-webapp-fetchmail::git+https://github.com/mpietruschka/kopano-webapp-fetchmail.git#tag=$_pkgverfetchmail"
       )

md5sums=(
	 'SKIP'
	 'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         
         # STANDALONE PLUGINS
         
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'         
         'SKIP'        
         'SKIP'
	 'SKIP'
	 'SKIP'	 
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP'
         )

build() {
    # create translations, compress javascript-files
    cd ${srcdir}/kopano-webapp
    ant deploy
    ant deploy-plugins

    # antdeploy-plugins leads to errors
    # execution one by one
    cd ${srcdir}
    for f in kopano-webapp-*; do
	if [ -d "$f" ];
	then
	    ## Standalone plugins seem not ment to be compiled
	    #dest="kopano-webapp/deploy/plugins/${f//kopano-webapp-/}"
        #mv $f $dest
        
        dest="kopano-webapp/plugins/${f//kopano-webapp-/}"
        mv $f $dest
	    cd $dest
	    ant deploy -Droot-folder="$(pwd)/../../" -Dtarget-folder="$(pwd)/../../deploy/plugins"
	    cd ${srcdir}
	fi
    done
}

package_kopano-webapp() {
    cd ${srcdir}/kopano-webapp/deploy
    
    # application
    install="${pkgname}.install"
    replaces=('zarafa-webapp')
    
    mkdir -p ${pkgdir}/usr/share/webapps/${pkgname}/
    cp -r * ${pkgdir}/usr/share/webapps/${pkgname}/
    cp ${srcdir}/kopano-webapp/.htaccess ${pkgdir}/usr/share/webapps/${pkgname}/

    rm -R ${pkgdir}/usr/share/webapps/${pkgname}/plugins/*
    rm ${pkgdir}/usr/share/webapps/${pkgname}/kopano-webapp.conf
    rm ${pkgdir}/usr/share/webapps/${pkgname}/config.php.dist
    rm ${pkgdir}/usr/share/webapps/${pkgname}/debug.php.dist

    # set version
    echo "${pkgver}" > ${pkgdir}/usr/share/webapps/${pkgname}/version

    ## precompress for nginx
    ${srcdir}/compress-static ${pkgdir}/usr/share/webapps/${pkgname}


    # config
    backup=("etc/webapps/${pkgname}/debug.php"
	    "etc/webapps/${pkgname}/config.php"
	    "etc/webapps/${pkgname}/nginx-location.conf"
	    "etc/php/conf.d/${pkgname}.ini"
    	"etc/php/fpm.d/${pkgname}.conf")    

    mkdir -p ${pkgdir}/etc/webapps/${pkgname}
    
    ## config examples
    cp ${srcdir}/php-fpm.example.conf ${pkgdir}/etc/webapps/${pkgname}/
    cp ${srcdir}/nginx-ssl.example.conf ${pkgdir}/etc/webapps/${pkgname}/
    cp ${srcdir}/nginx-location.conf ${pkgdir}/etc/webapps/${pkgname}/
    cp kopano-webapp.conf ${pkgdir}/etc/webapps/${pkgname}/apache.example.conf
    
    ## config mains
    cp config.php.dist ${pkgdir}/etc/webapps/${pkgname}/config.example.php
    cp debug.php.dist ${pkgdir}/etc/webapps/${pkgname}/debug.example.php
    sed -i -e 's|\(\"DEBUG_LOADER\", \).*$|\1LOAD_RELEASE);|' ${pkgdir}/etc/webapps/${pkgname}/debug.example.php    

    ln -s /etc/webapps/${pkgname}/config.php ${pkgdir}/usr/share/webapps/${pkgname}/config.php    

    ## php 
    mkdir -p ${pkgdir}/etc/php/conf.d
    cp ${srcdir}/${pkgname}.ini ${pkgdir}/etc/php/conf.d

    ## php-fpm
    mkdir -p ${pkgdir}/etc/php/fpm.d
    cp ${srcdir}/${pkgname}.conf ${pkgdir}/etc/php/fpm.d

    # /var/lib
    installdir http:http 0700 0600 ${pkgdir}/var/lib/${pkgname}
    installdir http:http 0700 0600 ${pkgdir}/var/lib/${pkgname}/plugins
    
    # /var/logs
    installdir http:http 0700 0600 ${pkgdir}/var/log/${pkgname}
    touch ${pkgdir}/var/log/${pkgname}/debug.txt
    ln -s /var/log/${pkgname}/debug.txt ${pkgdir}/usr/share/webapps/${pkgname}/debug.txt
}

package_kopano-webapp-contactfax() {
    depends=('kopano-webapp')
    package_plugin
}


package_kopano-webapp-folderwidgets() {
    depends=('kopano-webapp')
    package_plugin
}

package_kopano-webapp-gmaps() {
    depends=('kopano-webapp')
    package_plugin
}

package_kopano-webapp-pimfolder() {
    depends=('kopano-webapp')
    package_plugin
}

package_kopano-webapp-quickitems() {
    depends=('kopano-webapp')
    package_plugin
}

package_kopano-webapp-titlecounter() {
    depends=('kopano-webapp')
    package_plugin
}

package_kopano-webapp-webappmanual() {
    depends=('kopano-webapp')
    package_plugin
}

package_kopano-webapp-zdeveloper() {
    depends=('kopano-webapp')
    package_plugin
}


# STANDALONE PLUGINS
#
# Avoid wrong version by assigning version to each plugin
#

package_kopano-webapp-files() {
    pkgver="$_pkgverfiles"
    depends=('kopano-webapp')    
    
    pluginname="${pkgname//kopano-webapp-/}"
    cd ${srcdir}/kopano-webapp/deploy/plugins/$pluginname

    ## perform settings
    sed -i -e "s|\(PLUGIN_FILESBROWSER_LOGLEVEL', \)\(.*\)\();$\)|\1'ERROR'\3|" config.php    
    sed -i -e "s|\(PLUGIN_FILES_CACHE_DIR', \)\(.*\)\();$\)|\1'/var/lib/kopano-webapp/plugins/files'\3|" config.php

    package_plugin
}

package_kopano-webapp-filesbackendOwncloud() {
    pkgver="$_pkgverfilesowncloudbackend"
    depends=('kopano-webapp')
    package_plugin
}

package_kopano-webapp-filesbackendSMB() {
    pkgver="$_pkgverfilessmbbackend"
    depends=('kopano-webapp')
    package_plugin
}

package_kopano-webapp-filepreviewer() {
    pkgver="$_pkgverfilepreviewer"
    depends=('kopano-webapp')
    package_plugin
}


package_kopano-webapp-smime() {
    pkgver="$_pkgversmime"
    depends=('kopano-webapp')

    pluginname="${pkgname//kopano-webapp-/}"
    cd ${srcdir}/kopano-webapp/deploy/plugins/$pluginname
    
    ## perform settings    
    sed -i -e "s/\(PLUGIN_SMIME_CIPHER', \)\(.*\)\();$\)/\1OPENSSL_CIPHER_AES_256_CBC\3/" config.php
#    sed -i -e "s/\(PLUGIN_SMIME_CACERTS', \)\(.*\)\();$\)/\1\\'/etc/ssl/certs\\'\3/" config.php

    package_plugin
}

package_kopano-webapp-desktopnotifications() {
    pkgver="$_pkgverdesktopnotifications"
    depends=('kopano-webapp')

    pluginname="${pkgname//kopano-webapp-/}"
    cd ${srcdir}/kopano-webapp/deploy/plugins/$pluginname
    
    ## perform settings
    sed -i -e "s/\(PLUGIN_DESKTOPNOTIFICATION_USER_DEFAULT_ENABLE', \)\(.*\)\();$\)/\1true\3/" config.php

    package_plugin
}

package_kopano-webapp-intranet() {
    pkgver="$_pkgverintranet"
    depends=('kopano-webapp')
    package_plugin
}

package_kopano-webapp-mdm() {
    pkgver="$_pkgvermobiledevicemanagement"
    depends=('kopano-webapp'
	     'z-push')

    pluginname="${pkgname//kopano-webapp-/}"
    cd ${srcdir}/kopano-webapp/deploy/plugins/$pluginname

    ## perform settings
    sed -i -e "s/\(PLUGIN_MDM_USER_DEFAULT_ENABLE_MDM', \)\(.*\)\();$\)/\1true\3/" config.php
    sed -i -e "s/\(PLUGIN_MDM_SERVER', \)\(.*\)\();$\)/\1'127.0.0.1:81'\3/" config.php
    sed -i -e "s/\(PLUGIN_MDM_SERVER_SSL', \)\(.*\)\();$\)/\1false\3/" config.php
    
    package_plugin
}

package_kopano-webapp-spellchecker() {
    pkgver="$_pkgverspellchecker"
    depends=('kopano-webapp'
	     'php-enchant')

    package_plugin
}

package_kopano-webapp-spellchecker-languagepack-german-at() {
    pkgver="$_pkgverspellchecker"
    depends=('kopano-webapp-spellchecker')
    
    package_plugin
}

package_kopano-webapp-spellchecker-languagepack-german-ch() {
    pkgver="$_pkgverspellchecker"
    depends=('kopano-webapp-spellchecker')

    package_plugin
}

package_kopano-webapp-spellchecker-languagepack-german-de() {
    pkgver="$_pkgverspellchecker"
    depends=('kopano-webapp-spellchecker')
    
    package_plugin
}

package_kopano-webapp-spellchecker-languagepack-english-gb() {
    pkgver="$_pkgverspellchecker"
    depends=('kopano-webapp-spellchecker')
    
    package_plugin
}

package_kopano-webapp-spellchecker-languagepack-english-us() {
    pkgver="$_pkgverspellchecker"
    depends=('kopano-webapp-spellchecker')
    
    package_plugin
}

package_kopano-webapp-spellchecker-languagepack-spanish() {
    pkgver="$_pkgverspellchecker"
    depends=('kopano-webapp-spellchecker')
    
    package_plugin
}

package_kopano-webapp-spellchecker-languagepack-french() {
    pkgver="$_pkgverspellchecker"
    depends=('kopano-webapp-spellchecker')
    
    package_plugin
}

package_kopano-webapp-spellchecker-languagepack-italian-it() {
    pkgver="$_pkgverspellchecker"
    depends=('kopano-webapp-spellchecker')

    package_plugin
}

package_kopano-webapp-spellchecker-languagepack-dutch() {
    pkgver="$_pkgverspellchecker"
    depends=('kopano-webapp-spellchecker')

    package_plugin
}

package_kopano-webapp-passwd() {
    pkgver="$_pkgverpasswd"
    depends=('kopano-webapp')

    pluginname="${pkgname//kopano-webapp-/}"
    cd ${srcdir}/kopano-webapp/deploy/plugins/$pluginname

    ## perform settings
    sed -i -e "s/\(PLUGIN_PASSWD_USER_DEFAULT_ENABLE', \)\(.*\)\();$\)/\1true\3/" config.php

    package_plugin
}

package_kopano-webapp-fetchmail() {
    pkgver="$_pkgverfetchmail"
    depends=('kopano-webapp')
    package_plugin
}

# FUNCTIONS

package_plugin() {
    pluginname=${pkgname//kopano-webapp-/}
    
    ## override pluginname
    #if [[ ! -z "$1" ]];
    #then
    #    pluginname="$1"
    #fi
    
    cd ${srcdir}/kopano-webapp/deploy/plugins/$pluginname/

    groups=('kopano'
	    'kopano-webapp-plugins')
	    
    # /usr/share
    mkdir -p ${pkgdir}/usr/share/webapps/kopano-webapp/plugins/${pluginname}/
    cp -R * ${pkgdir}/usr/share/webapps/kopano-webapp/plugins/${pluginname}/
    rm -f ${pkgdir}/usr/share/webapps/kopano-webapp/plugins/${pluginname}/config.php
    ${srcdir}/compress-static ${pkgdir}/usr/share/webapps/kopano-webapp/plugins/${pluginname}/    
    
    # /var/lib
    installdir http:http 0700 0600 ${pkgdir}/var/lib/kopano-webapp/plugins/${pluginname}
    
    # /etc
    if [[ -e "config.php" ]];
    then
	backup=("etc/webapps/kopano-webapp/plugins/${pluginname}/config.php")

        ## perform settings
	# convert windows line break to unix: http://stackoverflow.com/questions/11680815/removing-windows-newlines-on-linux-sed-vs-awk
        sed -i -e $'s/\r//' config.php

	mkdir -p ${pkgdir}/etc/webapps/kopano-webapp/plugins/${pluginname}/

	## config mains	
	cp config.php ${pkgdir}/etc/webapps/kopano-webapp/plugins/${pluginname}/config.php
	ln -s /etc/webapps/kopano-webapp/plugins/${pluginname}/config.php ${pkgdir}/usr/share/webapps/kopano-webapp/plugins/${pluginname}/config.php
	
	## config examples
	cp ${pkgdir}/etc/webapps/kopano-webapp/plugins/${pluginname}/config.php ${pkgdir}/etc/webapps/kopano-webapp/plugins/${pluginname}/config.example.php
    fi
    
    if [[ -e "${srcdir}/${pkgname}.ini" ]];
    then
      ## php
      mkdir -p ${pkgdir}/etc/php/conf.d
      cp ${srcdir}/${pkgname}.ini ${pkgdir}/etc/php/conf.d		
    fi
    
    if [[ -e "${srcdir}/${pkgname}.install" ]];
    then
	${pkgname}.install
    else
	install=""
    fi    
}

installdir() {
    local owner="$1"
    local moddir="$2"
    local modfile="$3"
    local directory="$4"

    mkdir -p "$directory"
    find $directory -exec chown "$owner" {} \;
    find $directory -type f -exec chmod "$modfile" {} \;
    find $directory -type d -exec chmod "$moddir" {} \;
}

