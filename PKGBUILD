# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=xtl
pkgver=0.4.15
pkgrel=1
pkgdesc="QuantStack tools library - Basic tools (containers, algorithms) used by other quantstack packages"
arch=('any')
url="https://github.com/QuantStack/xtl"
license=('BSD-3-Clause')
depends=('gcc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/xtl/archive/${pkgver}.tar.gz")
sha512sums=('821c1b98f9aa83f93b102948af2e6e88aad37fd12a13a9f4c8a3f3f5806c9edf19bf2a595e47b3f8293e7bd5b681ab4965f8ad3675c4f344bbfff19b219f22ee')

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
