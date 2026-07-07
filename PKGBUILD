pkgname=qdia
pkgver=0.64
pkgrel=1
pkgdesc="Simple schematic/diagram editor with focus on quick diagram generation with high quality graphics, inspired by xcircuit"
arch=(x86_64)
url="https://github.com/sunderme/qdia"
license=(AGPL-3.0-or-later)
depends=(gcc-libs
         glibc
         qt6-base
         qt6-svg
         hicolor-icon-theme)
makedepends=(cmake
             qt6-tools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sunderme/qdia/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6e6117366211cf12ffde89fa96226d042482766e40ec8b23ecdf58fad12417f8')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
