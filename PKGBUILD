# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=kapow
pkgver=1.6.3
pkgrel=1
pkgdesc='Punch clock to track time spent on projects'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('0060c0af33ed933457d52741cda4e6f23f18507366d9217582b0eaab9a8118bf')

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
