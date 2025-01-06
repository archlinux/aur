# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tetzle
pkgver=3.0.1
pkgrel=1
pkgdesc='Tetromino jigsaw puzzle game'
arch=(x86_64)
url="https://gottcode.org/${pkgname}/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1961327cad9c3a551c8f71f8fb3d071df97310ec69f1fec179663c798da10856')

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
