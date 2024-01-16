# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=simsu
pkgver=1.4.3
pkgrel=1
pkgdesc='Basic Sudoku game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('77c690f242a073c99cb6fa08f039d02988110b34e211f0d8c7f0fe0b9c0e41a2')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
