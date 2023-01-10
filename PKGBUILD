# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=simsu
pkgver=1.4.2
pkgrel=1
pkgdesc='Basic Sudoku game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('7230293d7ff8d52b4a8d7f4e26638cff6e22e2a78edcc4ddaf7988da624fb37c')

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
