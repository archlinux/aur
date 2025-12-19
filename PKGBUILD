pkgname=qt-hearts
pkgver=1.0.1
pkgrel=1
pkgdesc="Classic hearts card game"
arch=('x86_64')
url="https://github.com/adelmonte/qt-hearts"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg' 'qt6-multimedia')
makedepends=('cmake' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0511fb050665b9bc3f1a15bff6b184b2689ef0ccbaf71731b81ea2baebf7edd6')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}
