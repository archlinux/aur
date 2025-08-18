# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=btail
pkgver=0.1.4
pkgrel=1
pkgdesc="Interactive File Tail Viewer TUI"
arch=("x86_64")
url="https://github.com/galalen/btail"
license=("MIT")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0b8668b9930f0a1ed65218396d01dce179abf878ab7b7afca1022969d2eb89e2')

build() {
    cd "$pkgname-$pkgver"
    go build -o btail cmd/btail/main.go
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 0755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
