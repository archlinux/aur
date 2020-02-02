# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=xtl
pkgver=0.6.11
pkgrel=1
pkgdesc="QuantStack tools library - Basic tools (containers, algorithms) used by other quantstack packages"
arch=('any')
url="https://github.com/QuantStack/xtl"
license=('BSD-3-Clause')
depends=('gcc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/xtl/archive/${pkgver}.tar.gz")

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
sha512sums=('cddbc1bc3cc9b899df596e23d3f49ba5892a169e4fcd14035194623e066778876b3a34ea1413ebada1f452189a4c4c8eb9b07f27c02534a0d671f00f71849793')
