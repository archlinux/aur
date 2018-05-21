# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=xtensor
pkgver=0.16.0
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
sha512sums=('e94c69f4f26e060c7569aa74db6a859e8ddce0df6935e45f68f82bff45caae3b394962ab6d150e8c0debc9fd14487ac22136b869b0fa80522f969842333b704c')
