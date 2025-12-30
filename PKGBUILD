pkgname=qt-hearts
pkgver=1.0.2
pkgrel=1
pkgdesc="Classic hearts card game"
arch=('x86_64')
url="https://github.com/adelmonte/qt-hearts"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg' 'qt6-multimedia')
makedepends=('cmake' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('768a726128fd2a96aacbe388c8d51909317b2b58101aa004130e4927210ed09d')

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
