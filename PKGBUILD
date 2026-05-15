pkgname=goport
pkgver=1.1.0
pkgrel=1
pkgdesc="Fast concurrent TCP/UDP port scanner written in Go"
arch=('x86_64')
url="https://github.com/Slashas632/goPort"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a4dfb5df03c555682ff3dc4d51086442119653a3308d04101f0a2eb43de9a518')

build() {
    cd "goPort-$pkgver"
    go build -o goport ./cmd/app
}

package() {
    cd "goPort-$pkgver"
    install -Dm755 goport "$pkgdir/usr/bin/goport"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
