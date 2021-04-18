# Maintainer: Mark Collins < tera_1225 hat hotmail dote com>
# Contributor: gls < ghostlovescorebg at gmail dot com >

pkgname=rompr
pkgver=1.57
pkgrel=1
pkgdesc="A php web frontend to MPD and Mopidy"
arch=('any')
license=('custom')
depends=('imagemagick'
         'php' # note that deps php-json, php-curl, php-xml and php-mbstring are included in php
         'php-sqlite'
         'php-gd'
         'php-intl')
optdepends=('apache: webserver to serve app'
            'nginx: webserver to serve app'
            'mysql: alternate database platform to sqlite')
source=("https://github.com/fatg3erman/RompR/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('0f0e67a6eb471ddc41366d09b5d3e4d04435970cbc2072cb5646289bebce0ff0')
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
