# Maintainer: Mark Collins < tera_1225 hat hotmail dote com>
# Contributor: gls < ghostlovescorebg at gmail dot com >

pkgname=rompr
pkgver=1.60.1
pkgrel=1
pkgdesc="A php web frontend to MPD and Mopidy"
arch=('any')
url='https://github.com/fatg3erman/RompR/'
license=('custom')
depends=('imagemagick'
         'php' # note that dependencies php-json, php-curl, php-xml and php-mbstring are included in php
         'php-sqlite'
         'php-gd'
         'php-intl')
optdepends=('apache: webserver to serve app'
            'nginx: webserver to serve app'
            'mysql: alternate database platform to sqlite')
source=("https://github.com/fatg3erman/RompR/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('35c1af52754468aece86ad3428a3a94246bdbad9992beef9999c413b8caeb8d5')
install="${pkgname}.install"

package() {
   cd "${srcdir}"
   find -name '.svn' -delete
   install -d "${pkgdir}/usr/share/webapps"
   cp -ra "$pkgname" "${pkgdir}/usr/share/webapps/"
   install -d "${pkgdir}/var/lib/${pkgname}/albumart"
   ln -s "/var/lib/${pkgname}/albumart" "${pkgdir}/usr/share/webapps/${pkgname}/albumart"
   install -d "${pkgdir}/var/lib/${pkgname}/prefs"
   ln -s "/var/lib/${pkgname}/prefs"    "${pkgdir}/usr/share/webapps/${pkgname}/prefs"
}
