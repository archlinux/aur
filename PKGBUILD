pkgname=goport
pkgver=1.2.0
pkgrel=1
pkgdesc="Fast concurrent TCP/UDP port scanner written in Go"
arch=('x86_64')
url="https://github.com/Slashas632/goPort"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8cc0426d05c26ff5e27419d21e23e07d6a592cca20182d02d050304b4aa648b7')

build() {
    cd "goPort-$pkgver"
    go build -o goPort ./cmd/app
}

package() {
    cd "goPort-$pkgver"
    install -Dm755 goPort "$pkgdir/usr/bin/goPort"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
