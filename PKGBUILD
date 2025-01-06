# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=cutemaze
pkgver=1.3.4
pkgrel=1
pkgdesc='Top-down maze game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL3')
depends=('qt6-base' 'qt6-svg')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('0ca5a0ff0b964ac8ecf5d90995a9c8c508555a979b591c7987a4918b9c859bce')

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
