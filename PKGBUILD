# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=volgo
pkgver=0.0.1
pkgrel=1
pkgdesc="Simple CLI + TUI for managing system volume"
arch=("x86_64")
url="https://github.com/elliot40404/volgo"
license=("MIT")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aada464dad8704ee0fe5fea22c7e6702d4211e2541568f8b70988d3de9adeafd')

build() {
    cd "$pkgname-$pkgver"
    go build -o volgo cmd/volgo/main.go
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 0755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
