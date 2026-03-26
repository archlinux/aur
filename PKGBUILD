pkgname=ojcsh
pkgver=2.5.0
pkgrel=1
pkgdesc="A lightweight, minimal, and extensible Unix-like shell written in pure C — first building block of OJclicks OS"
keywords=('shell' 'unix' 'c' 'terminal' 'cli' 'ojclicks' 'lightweight' 'minimal' 'os' 'term')
arch=('x86_64')
url="https://github.com/gragero/OJC-shell"
license=('MIT')
depends=('glibc' 'readline')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gragero/OJC-shell/archive/refs/tags/V2.5.0.tar.gz")
sha256sums=('05bfbf2759949a65d87854838704e983105ccb95742073dd15adc791c460cf6e')

build() {
    cd "$srcdir/OJC-shell-$pkgver"
    gcc -o ojcsh main.c -lreadline 
}

package() {
    cd "$srcdir/OJC-shell-$pkgver"
    install -Dm755 ojcsh "$pkgdir/usr/bin/ojcsh"
}
