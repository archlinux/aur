# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Andre Wayand <aur-awl@awayand.sleepmail.com>

pkgname='awl'
pkgver='0.57'
pkgrel=1
pkgdesc="Andrew's php Web Libraries"
arch=('any')
url="https://gitlab.com/davical-project/awl/"
license=('GPL2')
depends=('php' 'make')
install="${pkgname}.install"
source=("https://gitlab.com/davical-project/awl/repository/archive.tar.bz2?ref=master")
sha256sums=('SKIP')

prepare() {
      cd "${srcdir}"
      mv awl-* awl
}
build() {
  cd "${srcdir}/${pkgname}"
  make
}
package() {
  cd "${srcdir}/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -rf * "${pkgdir}/usr/share/${pkgname}"

}

