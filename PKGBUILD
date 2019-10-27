# Maintainer: Shatur <genaloner@gmail.com>

pkgname=akd
pkgver=1.0.0
pkgrel=1
pkgdesc="Keyboard userspace daemon"
arch=('x86_64')
url="https://github.com/Shatur95/akd"
license=('GPL3')
depends=('libx11')
makedepends=('gcc' 'cmake')
source=($pkgname-$pkgver.tar.gz::"https://github.com/Shatur95/akd/archive/$pkgver.tar.gz")
sha256sums=('ca3e1a6c51be5f999c757830cd32eb5b061e599f406f80323a580ce34fe8db43')

prepare() {
    cd "$pkgname-$pkgver"
    cmake .
}

build() {
    cd "$pkgname-$pkgver"
    cmake --build .
}

package() {
    cd "$pkgname-$pkgver"
    cmake --install . --prefix "$pkgdir/usr"
} 
