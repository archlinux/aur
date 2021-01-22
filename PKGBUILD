# Maintainer: Daniel Menelkir <menelkir at itroll dot org>

pkgname=g15composer
pkgver=3.3
pkgrel=1
pkgdesc="A library to render text and shapes into a buffer usable by the Logitech G15"

arch=('x86_64')
url="https://gitlab.com/menelkir/g15composer"
license=('GPL')
depends=('g15daemon')
source=(https://gitlab.com/menelkir/g15composer/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2)
sha512sums=('67f2b55d499099e61746c0530f72af734aea192e070b46e9dce2bd84dd8956553d5e8f8b1dfbf3c9bb0ed6151dd33d6cd04cc174f37c1a2495b5d7960035f0d7')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}
