# Maintainer: Daniel Menelkir <menelkir at itroll dot org>

pkgname=g15message
pkgver=1.2
pkgrel=2
pkgdesc="A simple message/alert tool for g15daemon and the Logitech G15."

arch=('x86_64')
url="https://gitlab.com/menelkir/g15message"
license=('GPL')
depends=('g15daemon')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2)
sha512sums=('64740917deb43054fd006ab084fb89ac3a7e8877664c22d4bdf92f0bf97dee0985c873eb7bf858a12f7a6e46bb15d0c99d91e7db047dddbf3ea4a8c26569b042')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}
