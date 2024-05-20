# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=stackandconquer
pkgver=0.10.1
pkgrel=1
pkgdesc='A challenging tower conquest board game.'
arch=('x86_64')
url='https://github.com/ElTh0r0/stackandconquer/'
license=('GPL-3.0-or-later')
makedepends=('cmake' 'qt6-tools')
depends=('qt6-declarative' 'qt6-svg' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ElTh0r0/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3bca84d87981c34bf6f38aa653e6ca3b133f905d8fa6edc3cfc64fac7136c718')

build() {
    cmake -B build-cmake -S "${pkgname}-${pkgver}" \
      -DCMAKE_PREFIX_PATH=/usr/include/qt6 \
      -DCMAKE_INSTALL_PREFIX="/usr"
    cmake --build build-cmake
}

package() {
    DESTDIR="$pkgdir/" cmake --install build-cmake
}
