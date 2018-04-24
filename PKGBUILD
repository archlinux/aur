# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=xtensor
pkgver=0.15.9
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('gcc')
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

sha512sums=('0be36937d2b1a40658526465f28f6e7365cd5d154075472c2d94321bc418b54c2c8ce14d143a85b2cae481b384253689f00c43bfb563023ef86d44a409a21a2a')
