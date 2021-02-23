# Maintainer: Daniel Menelkir <menelkir at itroll dot org>

pkgname=g15composer
pkgver=3.3
pkgrel=3
pkgdesc="A library to render text and shapes into a buffer usable by the Logitech G15"

arch=('x86_64')
url="https://gitlab.com/menelkir/g15composer"
license=('GPL')
depends=('g15daemon')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('6e1a9897537d292c94360a5e88bc04b1863a493cc024ac1ada2743ffdba6cf57fb9dc0a3f9690ec729cc1fb9cc321960bf770ef1a04ceeec5b29217b3c0397b2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
