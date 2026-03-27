pkgname=ojcsh
pkgver=2.6.6
pkgrel=1
pkgdesc="A lightweight, minimal, and extensible Unix-like shell written in pure C — first building block of OJclicks OS"
keywords=('shell' 'unix' 'c' 'terminal' 'cli' 'ojclicks' 'lightweight' 'minimal' 'os' 'term')
arch=('x86_64')
url="https://github.com/gragero/OJC-shell"
license=('MIT')
depends=('glibc' 'readline')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gragero/OJC-shell/archive/refs/tags/V2.6.6.tar.gz")
sha256sums=('c4cdc6d812aa43159ced1a4847c57297b6687087b21f36e7959c1ab450bd5876')

build() {
    cd "$srcdir/OJC-shell-$pkgver"
    make 
}

package() {
    cd "$srcdir/OJC-shell-$pkgver"
    install -Dm755 ojcsh "$pkgdir/usr/bin/ojcsh"
}
