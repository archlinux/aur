pkgname=ojcsh
pkgver=2.7.3
pkgrel=1
pkgdesc="A lightweight, minimal, and extensible Unix-like shell written in pure C — first building block of OJclicks OS"
keywords=('shell' 'unix' 'c' 'terminal' 'cli' 'ojclicks' 'lightweight' 'minimal' 'os' 'term')
arch=('x86_64')
url="https://github.com/gragero/OJC-shell"
license=('MIT')
depends=('glibc' 'readline')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gragero/OJC-shell/archive/refs/tags/V2.7.3.tar.gz")
sha256sums=('effcab3b569e85c229ddfb65f5ff43e91c5cc6c79713e29195373ff414d22cc7')

build() {
    cd "$srcdir/OJC-shell-$pkgver/src"
    make 
}

package() {
    cd "$srcdir/OJC-shell-$pkgver/src"
    install -Dm755 ojcsh "$pkgdir/usr/bin/ojcsh"
}
