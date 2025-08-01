pkgname=installer
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple TUI installer tool written in Go"
arch=('x86_64')
url="https://github.com/leithXD/installer-go"
license=('MIT')
depends=('yay') 
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/heads/master.tar.gz")
sha256sums=('SKIP') 

build() {
    cd "$srcdir"/installer-go-*
    go build -o installer
}

package() {
    cd "$srcdir"/installer-go-*
    install -Dm755 installer "$pkgdir/usr/bin/installer"
}
