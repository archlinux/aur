# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=fritzcallindicator
pkgver=0.10.0
pkgrel=1
pkgdesc='Show taskbar notifications for incoming calls from the Fritz!Box.'
arch=('i686' 'x86_64')
url='https://github.com/ElTh0r0/fritzcallindicator/'
license=('GPL-3.0-or-later')
makedepends=('cmake' 'qt6-tools')
depends=('qt6-base' 'qt6-multimedia' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElTh0r0/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('618530b8444ebafbc8f6abec39ac35cd06b99af44a6f91c1bfdcce9ffa7ba77f')

build() {
    cmake -B build-cmake -S "${pkgname}-${pkgver}" \
      -DCMAKE_PREFIX_PATH=/usr/include/qt6 \
      -DCMAKE_INSTALL_PREFIX="/usr"
    cmake --build build-cmake
}

package() {
    DESTDIR="$pkgdir/" cmake --install build-cmake
}
