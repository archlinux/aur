# Maintainer: Gabriel Vasconcelos <gavasc@proton.me>
pkgname=tuidger
pkgver=0.2.4
pkgrel=1
pkgdesc="Terminal personal finance manager"
arch=('x86_64' 'aarch64')
url="https://github.com/gavasc/tuidger"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ab366d4dbfb057007a7b3aea224872ae948bd295798fbf841ea708b5ebd3266d')

build() {
    cd "$pkgname-$pkgver"
    go build -ldflags "-s -w -X main.version=$pkgver" -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
