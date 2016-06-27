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
sha256sums=('fdb2757b8e6641beba27e8d58102479305d7c78f1559df63256bcac0b715a0dd')

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

