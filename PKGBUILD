pkgname=goport
pkgver=1.1.1
pkgrel=1
pkgdesc="Fast concurrent TCP/UDP port scanner written in Go"
arch=('x86_64')
url="https://github.com/Slashas632/goPort"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e9aafbcbe47cd26dc901ef1745b39829e6a3aef973708b12754e35fba3afcc51')

build() {
    cd "goPort-$pkgver"
    go build -o goport ./cmd/app
}

package() {
    cd "goPort-$pkgver"
    install -Dm755 goport "$pkgdir/usr/bin/goport"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
