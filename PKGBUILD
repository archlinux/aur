# Maintainer: Gabriel Vasconcelos <gavasc@proton.me>
pkgname=tuidger
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal personal finance manager"
arch=('x86_64' 'aarch64')
url="https://github.com/gavasc/tuidger"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dd2d566dadd3d1e8ddaebc0f20cc93d1bbe72c0d331290e4a7cebdda2bd3526a')

build() {
    cd "$pkgname-$pkgver"
    go build -ldflags "-s -w -X main.version=$pkgver" -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
