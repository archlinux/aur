# Maintainer: Shatur <genaloner@gmail.com>

pkgname=akd
pkgver=2.1.0
pkgrel=1
pkgdesc="A Keyboard userspace daemon"
arch=(x86_64)
url="https://github.com/Shatur95/akd"
license=(GPL3)
depends=(libx11 boost)
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('3a6c5e9273dacdacdcc87ebb9115612242839282a0e0345eb77250a70c814238')

build() {
    cd $pkgname-$pkgver
    cmake -D CMAKE_BUILD_TYPE=Release . 
    cmake --build .
}

package() {
    cd $pkgname-$pkgver
    cmake --install . --prefix "$pkgdir/usr"
} 
