# Maintainer: Gabriel Vasconcelos <gavasc@proton.me>
pkgname=tuidger
pkgver=0.2.6
pkgrel=1
pkgdesc="Terminal personal finance manager"
arch=('x86_64' 'aarch64')
url="https://github.com/gavasc/tuidger"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1e0a0993e29a68b914201489b28c31b6df381a01cbcee9a0407344bb4db21796')

build() {
    cd "$pkgname-$pkgver"
    go build -ldflags "-s -w -X main.version=$pkgver" -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
