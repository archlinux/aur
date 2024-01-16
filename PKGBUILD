# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tanglet
pkgver=1.6.5
pkgrel=1
pkgdesc='Single player word finding game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('effdfdcf265436cc160d09c05f8712da416c00644e338817c13da8d0c6f1704b')

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
