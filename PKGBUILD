# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=fritzcallindicator
pkgver=0.7.0
pkgrel=1
pkgdesc='Show taskbar notifications for incoming calls from the Fritz!Box.'
arch=('i686' 'x86_64')
url='https://github.com/ElTh0r0/fritzcallindicator/'
license=('GPL-3.0-or-later')
makedepends=('cmake' 'qt6-tools')
depends=('qt6-base' 'qt6-multimedia' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElTh0r0/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8d3b14cbde4d104cdeefa95feb8edae17ef4f16e3d85402025c2888d811a9854')

build() {
    cmake -B build-cmake -S "${pkgname}-${pkgver}" \
      -DCMAKE_PREFIX_PATH=/usr/include/qt6 \
      -DCMAKE_INSTALL_PREFIX="/usr"
    cmake --build build-cmake
}

package() {
    DESTDIR="$pkgdir/" cmake --install build-cmake
}
