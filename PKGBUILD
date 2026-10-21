pkgname=qdia
pkgver=0.66
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
sha256sums=('427d6489e5d783d2089917a4500dbf4063b9e8ac92124c41764cb07b94168d93')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
