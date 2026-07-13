pkgname=irontick
_pkgname=IronTick
pkgver=1.0
pkgrel=1
pkgdesc="A lightweight, precise, and cross-platform metronome application"
arch=(x86_64)
url="https://github.com/sunderme/qdia"
license=(GPL-3.0-or-later)
depends=(glibc
         qt6-base
         qt6-multimedia)
makedepends=(cmake
             qt6-tools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/olegkapitonov/IronTick/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('354f0bbdc3aae94c1430d3822fe13167ccd6dd9699c41af9cad64e3327c266de')

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
    
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
