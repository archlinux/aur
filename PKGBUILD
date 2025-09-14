pkgname=hypergraphgo
pkgver=1.0.0
pkgrel=1
pkgdesc="Hypergraph & HoTT tooling in Go"
arch=('x86_64')
url="https://github.com/watchthelight/HypergraphGo"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/HypergraphGo-$pkgver"
    go build -o hg ./cmd/hg
}

package() {
    cd "$srcdir/HypergraphGo-$pkgver"
    install -Dm755 hg "$pkgdir/usr/bin/hg"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
