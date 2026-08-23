# Maintainer: ayonelnx <vidskix@gmail.com>
pkgname=ggdo
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple sudo-like command written in Go with password caching"
arch=('x86_64')
url="https://codeberg.org/ayonelnx/ggdo"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/ayonelnx/ggdo/raw/branch/main/ggdo-1.0.0.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    go mod download
    go build -o ggdo main.go
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 ggdo "$pkgdir/usr/bin/ggdo"
    chmod u+s "$pkgdir/usr/bin/ggdo"
    install -Dm644 README.md "$pkgdir/usr/share/doc/ggdo/README.md"
}
