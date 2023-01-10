# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=cutemaze
pkgver=1.3.2
pkgrel=1
pkgdesc='Top-down maze game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL3')
depends=('qt6-base' 'qt6-svg')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('8630e5635f0ef950c947af2fc2b219c2c4006b8d3153e5776c2000e061472444')

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
