# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=xtensor
pkgver=0.21.4
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('xtl')
makedepends=('gcc' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")

build() {
	cd "${pkgname}-${pkgver}"
  [ ! -d build ] && mkdir build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
  make
}

package() {
	cd "${pkgname}-${pkgver}/build"
  make install
}
sha512sums=('8f22475b5aad1c9b184950021a256d711ca9d4be799d2e55b37b943d6bcc614797105a18fcf8cbdce9544c597256f9c4136ac5377a1795077dfe904f8b00cc55')
