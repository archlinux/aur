# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=xtl
pkgver=0.4.9
pkgrel=1
pkgdesc="QuantStack tools library - Basic tools (containers, algorithms) used by other quantstack packages"
arch=('any')
url="https://github.com/QuantStack/xtl"
license=('BSD-3-Clause')
depends=('gcc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/xtl/archive/${pkgver}.tar.gz")
sha512sums=('d6b9abd6cfc0e1cd27c1f8b898b207ddde41ad0b3f6abc2907c462a1f9e6c675cbc7df51fa40fe74374d5ad012d3f2ead1345a5c70d5882a5760746c1c800c1b')

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
