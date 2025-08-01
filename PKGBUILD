pkgname=installer
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple TUI installer tool written in Go"
arch=('x86_64')
url="https://github.com/leithXD/installer-go"
license=('MIT')
depends=('yay') 
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP') 

build() {
    cd "$srcdir/$pkgname-$pkgver"
    go build -o installer
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 installer "$pkgdir/usr/bin/installer"
}
