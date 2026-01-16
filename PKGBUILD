# Maintainer: Your Name <your@email.com>
pkgname=switchcal
pkgver=1.0.0
pkgrel=1
pkgdesc="GTK4 calendar application with Google Calendar sync"
arch=('x86_64')
url="https://github.com/djwarf/switchcal"
license=('MIT')
depends=('gtk4' 'glib2')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build -o switchcal ./cmd/switchcal
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 switchcal "$pkgdir/usr/bin/switchcal"
}
