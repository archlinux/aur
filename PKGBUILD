pkgname=goport
pkgver=1.1.2
pkgrel=2
pkgdesc="Fast concurrent TCP/UDP port scanner written in Go"
arch=('x86_64')
url="https://github.com/Slashas632/goPort"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0d5728e6e839fb0bd7c159a235cb94a147ea72d6a373ace0e425ead039e7617b')

build() {
    cd "goPort-$pkgver"
    go build -o goPort ./cmd/app
}

package() {
    cd "goPort-$pkgver"
    install -Dm755 goPort "$pkgdir/usr/bin/goPort"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
