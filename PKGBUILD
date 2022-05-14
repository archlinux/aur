# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=g15utils
pkgver=0.2
pkgrel=2
pkgdesc="Two utilities to be used with Logitech G15 screens."

arch=('x86_64')
url="https://gitlab.com/menelkir/g15utils"
license=('GPL')
depends=('g15daemon')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2)
sha512sums=('0476967314570de98f7addf952790d369387eb094133fd394f7881210abf99c99884aace6023de80d8e9319f0422940b628b24431f40d0dde99e18d5e75f0942')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}
