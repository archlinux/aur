# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=fritzcallindicator
pkgver=0.8.0
pkgrel=1
pkgdesc='Show taskbar notifications for incoming calls from the Fritz!Box.'
arch=('i686' 'x86_64')
url='https://github.com/ElTh0r0/fritzcallindicator/'
license=('GPL-3.0-or-later')
makedepends=('cmake' 'qt6-tools')
depends=('qt6-base' 'qt6-multimedia' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElTh0r0/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4e087b156fc67ee3e9856ae74037d0149c98700047b79606fc5016bd6b637585')

build() {
    cmake -B build-cmake -S "${pkgname}-${pkgver}" \
      -DCMAKE_PREFIX_PATH=/usr/include/qt6 \
      -DCMAKE_INSTALL_PREFIX="/usr"
    cmake --build build-cmake
}

package() {
    DESTDIR="$pkgdir/" cmake --install build-cmake
}
