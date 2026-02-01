pkgname=qdia
pkgver=0.60
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
sha256sums=('349ef083af478120ba26c00fd497b8819002e3d34afa4816997af91c84dd515c')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
