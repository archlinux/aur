# Maintainer:  Arvedui <arvedui@posteo.de>
# Contributor: Immae <ismael.bouya@normalesup.org>
# Contributor: Stefan Tatschner <stefan@sevenbyte.org>
# Contributor: Derek Leach <mail@derek.name>

pkgname=infcloud
pkgver=0.13.1
pkgrel=1
pkgdesc="A Card- and WebDav web client"
arch=('any')
url="http://www.inf-it.com/open-source/clients/infcloud/"
license=('AGPL3')
depends=('ed')
backup=('etc/webapps/infcloud/config.js')
install=${pkgname}.install
source=("https://www.inf-it.com/InfCloud_${pkgver}.zip")
md5sums=('6ffb1b3b9b7f54137723c6c13e9c5635')

package() {
  install -d ${pkgdir}/usr/share/webapps/
  cp -a ${srcdir}/${pkgname} ${pkgdir}/usr/share/webapps/

  install -d ${pkgdir}/etc/webapps/${pkgname}

  mv ${pkgdir}/usr/share/webapps/${pkgname}/config.js ${pkgdir}/etc/webapps/${pkgname}/config.js
  ln -s /etc/webapps/${pkgname}/config.js ${pkgdir}/usr/share/webapps/${pkgname}/config.js

}
