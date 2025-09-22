# Maintainer: Valery Nosareu <cstrp.dev@gmail.com>
pkgname=translatego
pkgver=1.2.0
pkgrel=1
pkgdesc="A terminal-based multi-service translation tool written in Go"
arch=('x86_64')
url="https://github.com/cstrp-dev/translatego"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    go build -o translatego ./cmd/main.go
}

package() {
    cd "$pkgname"
    install -Dm755 translatego "$pkgdir/usr/bin/translatego"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
