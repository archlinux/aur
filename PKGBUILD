# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tetzle
pkgver=3.0.0
pkgrel=1
pkgdesc='Tetromino jigsaw puzzle game'
arch=(x86_64)
url="https://gottcode.org/${pkgname}/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('bdb3b1769e8d52aa1c440ffdfb553fd957f7e605653b95f299507dfaa01d906b')

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
