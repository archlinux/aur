# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>
# Contributor: Derek Leach <mail@derek.name>

pkgname=carddavmate
pkgver=0.12.0
pkgrel=1
pkgdesc="A CardDav web client"
arch=('any')
url="http://www.inf-it.com/open-source/clients/carddavmate/"
license=('AGPL3')
depends=('ed')
optdepends=('apache: Webserver to run CardDavMATE')
backup=('etc/webapps/carddavmate/config.js'
        'etc/webapps/carddavmate/apache.example.conf')
install=${pkgname}.install
source=("http://www.inf-it.com/CardDavMATE_${pkgver}.zip"
        'apache.example.conf')
md5sums=('58636140d23472fce688bcd356b43f16'
         '16fedd024cede2aa359076d7a988072d')

package() {
  install -d ${pkgdir}/usr/share/webapps/
  cp -a ${srcdir}/${pkgname} ${pkgdir}/usr/share/webapps/

  install -d ${pkgdir}/etc/webapps/${pkgname}
  install -m 644 ${srcdir}/apache.example.conf ${pkgdir}/etc/webapps/${pkgname}

  mv ${pkgdir}/usr/share/webapps/${pkgname}/config.js ${pkgdir}/etc/webapps/${pkgname}/config.js
  ln -s /etc/webapps/${pkgname}/config.js ${pkgdir}/usr/share/webapps/${pkgname}/config.js
}
