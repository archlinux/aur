# Maintainer: Your Name <your.email@example.com>
pkgname=crush-demo
pkgver=1.0.0
pkgrel=1
pkgdesc="A dummy file compression utility"
arch=('x86_64')
url="https://github.com/sst/crush"
license=('MIT')
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/sst/crush/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    # For a dummy package, we'll just compile a simple C program
    gcc -o crush crush.c
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 crush "$pkgdir/usr/bin/crush"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}