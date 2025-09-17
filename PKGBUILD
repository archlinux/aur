# Maintainer: Valery Nosareu <cstrp.dev@gmail.com>
pkgname=translatego
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal-based multi-service translation tool written in Go"
arch=('x86_64')
url="https://github.com/cstrp/translatego"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0deac4a2a19d50b0bb0c73b49bc3e864b8931f2e26122f65a06daf9d982b7fbd')

build() {
    cd "$pkgname-$pkgver"
    go build -o translatego ./cmd/main.go
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 translatego "$pkgdir/usr/bin/translatego"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
