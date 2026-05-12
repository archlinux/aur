pkgname=goport
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast concurrent TCP/UDP port scanner written in Go"
arch=('x86_64')
url="https://github.com/Slashas632/goPort"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4690b421f5cd280f6e4425d44611535687c366f0c2f957251f0cb47c7463948f')

build() {
    cd "goPort-$pkgver"
    go build -o goport ./cmd/app
}

package() {
    cd "goPort-$pkgver"
    install -Dm755 goport "$pkgdir/usr/bin/goPort"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
