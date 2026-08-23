# Maintainer: Ayone
pkgname=ggdo
pkgver=1.0.0
pkgrel=1
pkgdesc="A sudo equivalent written in Go"
arch=('x86_64')
url="https://codeberg.org/ayonelnx/ggdo"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    go mod download
    go build -o ggdo main.go
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 gorsu "$pkgdir/usr/bin/ggdo"
    chmod u+s "$pkgdir/usr/bin/ggdo"
    install -Dm644 README.md "$pkgdir/usr/share/doc/gorsu/README.md"
}
