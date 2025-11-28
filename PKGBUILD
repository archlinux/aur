# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=fritzcallindicator
pkgver=0.9.0
pkgrel=1
pkgdesc='Show taskbar notifications for incoming calls from the Fritz!Box.'
arch=('i686' 'x86_64')
url='https://github.com/ElTh0r0/fritzcallindicator/'
license=('GPL-3.0-or-later')
makedepends=('cmake' 'qt6-tools')
depends=('qt6-base' 'qt6-multimedia' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElTh0r0/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5989e538728677c5c531cccb4d33f01c35a631d770124aec313cea585df593aa')

build() {
    cmake -B build-cmake -S "${pkgname}-${pkgver}" \
      -DCMAKE_PREFIX_PATH=/usr/include/qt6 \
      -DCMAKE_INSTALL_PREFIX="/usr"
    cmake --build build-cmake
}

package() {
    DESTDIR="$pkgdir/" cmake --install build-cmake
}
