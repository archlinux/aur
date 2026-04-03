# Maintainer: rainblower 
pkgname=gmon
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight, cross-platform system resource monitor for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/Rainblower/gmon"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52f8a88972606e8dc917b984513f1bdafd208eb08933902d56f8ec13cfc6b180')

build() {
    cd "$pkgname-$pkgver"
    go build -ldflags="-s -w" -o gmon .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 gmon "$pkgdir/usr/bin/gmon"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
