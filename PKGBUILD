pkgname=ojcsh
pkgver=2.7.8
pkgrel=1
pkgdesc="A lightweight, minimal, and extensible Unix-like shell written in pure C — first building block of OJclicks OS"
keywords=('shell' 'unix' 'c' 'terminal' 'cli' 'ojclicks' 'lightweight' 'minimal' 'os' 'term')
arch=('x86_64')
url="https://github.com/gragero/OJC-shell"
license=('MIT')
depends=('glibc' 'readline')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gragero/OJC-shell/archive/refs/tags/V2.7.8.tar.gz")
sha256sums=('0f5557cde4faf3272626d8097c43d106f2c4c8e06c9c69d22da0ba9739e43157')

build() {
    cd "$srcdir/OJC-shell-$pkgver/src"
    make 
}

package() {
    cd "$srcdir/OJC-shell-$pkgver/src"
    install -Dm755 ojcsh "$pkgdir/usr/bin/ojcsh"
}
