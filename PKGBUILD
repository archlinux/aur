# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=cutemaze
pkgver=1.3.6
pkgrel=1
pkgdesc='Top-down maze game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'qt6-base' 'qt6-svg')
makedepends=('appstream' 'cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('165fdfb0a074e0a9f81f090d96972e477c132457e7d601a04464f04543436b06')

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
