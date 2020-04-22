# Maintainer: Shatur <genaloner@gmail.com>

pkgname=akd
pkgver=2.0.0
pkgrel=1
pkgdesc="A Keyboard userspace daemon"
arch=(x86_64)
url="https://github.com/Shatur95/akd"
license=(GPL3)
depends=(libx11 boost)
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('d9a7d356a9689ac9d2bef9794266d8794de47e93af639c5f8c1db1f512e06870')

build() {
    cd $pkgname-$pkgver
    cmake -D CMAKE_BUILD_TYPE=Release . 
    cmake --build .
}

package() {
    cd $pkgname-$pkgver
    cmake --install . --prefix "$pkgdir/usr"
} 
