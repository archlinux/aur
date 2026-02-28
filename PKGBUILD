# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=iqpuzzle
pkgver=1.5.0
pkgrel=1
pkgdesc='IQ challenging pentomino puzzle.'
arch=('i686' 'x86_64')
url='https://github.com/ElTh0r0/iqpuzzle/'
license=('GPL-3.0-or-later')
makedepends=('cmake' 'qt6-tools')
depends=('qt6-base' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElTh0r0/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('84dbce31b6d9059ddc7990994da1b407209bbcb34af3797142e770ec0312e16f')

build() {
    cmake -B build-cmake -S "${pkgname}-${pkgver}" \
      -DCMAKE_PREFIX_PATH=/usr/include/qt6 \
      -DCMAKE_INSTALL_PREFIX="/usr"
    cmake --build build-cmake
}

package() {
    DESTDIR="$pkgdir/" cmake --install build-cmake
}
