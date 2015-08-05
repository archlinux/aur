# Maintainer: MartiMcFly martimcfly@autorisation.de

pkgname=('zarafa-webapp-passwd')
_pkgname=('passwd')
pkgver=1.2
pkgrel=2
pkgdesc=('Passwd plugin for Zarafa Webapp')
arch=('any')
url=('https://github.com/silentsakky/zarafa-webapp-passwd')
source=("https://github.com/silentsakky/zarafa-webapp-passwd/raw/master/builds/passwd-1.2.zip")
license=('AGPL3')
depends=('zarafa-webapp'
	 'php')
md5sums=('65153d48c97fd60df9e37f0cff2b52c1')

package() {
    cd ${srcdir}/${_pkgname}

    # create folders
    mkdir -p ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/
    cp -r * ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/

    # perform settings
    # => enable plugin for all users
    sed -i -e "s/\(PLUGIN_PASSWD_USER_DEFAULT_ENABLE', \)\(.*\)\();$\)/\1true\3/" ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/config.php
}
