# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=stackandconquer
pkgver=0.12.0
pkgrel=1
pkgdesc='A challenging tower conquest board game.'
arch=('x86_64')
url='https://codeberg.org/ElTh0r0/stackandconquer/'
license=('GPL-3.0-or-later')
makedepends=('cmake' 'qt6-tools')
depends=('qt6-declarative' 'qt6-svg' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/ElTh0r0/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b2eee1d710c754d10d8bbcaaa4e136fc364cda40070aeedc1e0fc6c198055237')

build() {
    cmake -B build-cmake -S "${pkgname}" \
      -DCMAKE_PREFIX_PATH=/usr/include/qt6 \
      -DCMAKE_INSTALL_PREFIX="/usr"
    cmake --build build-cmake
}

package() {
    DESTDIR="$pkgdir/" cmake --install build-cmake
}
