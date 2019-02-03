# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=xtensor
pkgver=0.19.2
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('gcc' 'xtl' 'nlohmann-json')
makedepends=('cmake')
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
sha512sums=('a26529667a5d1fafd957c8163ab498e79f3594f03d7a3313d38a068e089264088fd6013b40df6bd53dc43618708869229eeb05f63bfa245a2d6c8b54860f16b5')
