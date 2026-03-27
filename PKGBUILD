pkgname=ojcsh
pkgver=2.6.5
pkgrel=1
pkgdesc="A lightweight, minimal, and extensible Unix-like shell written in pure C — first building block of OJclicks OS"
keywords=('shell' 'unix' 'c' 'terminal' 'cli' 'ojclicks' 'lightweight' 'minimal' 'os' 'term')
arch=('x86_64')
url="https://github.com/gragero/OJC-shell"
license=('MIT')
depends=('glibc' 'readline')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gragero/OJC-shell/archive/refs/tags/V2.6.5.tar.gz")
sha256sums=('7d71a326d441415548d111164f5d21cac70bed884868a0c0ba2952cb67284a57')

build() {
    cd "$srcdir/OJC-shell-$pkgver"
    make 
}

package() {
    cd "$srcdir/OJC-shell-$pkgver"
    install -Dm755 ojcsh "$pkgdir/usr/bin/ojcsh"
}
