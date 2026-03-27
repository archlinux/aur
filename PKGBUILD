pkgname=ojcsh
pkgver=2.7.5
pkgrel=1
pkgdesc="A lightweight, minimal, and extensible Unix-like shell written in pure C — first building block of OJclicks OS"
keywords=('shell' 'unix' 'c' 'terminal' 'cli' 'ojclicks' 'lightweight' 'minimal' 'os' 'term')
arch=('x86_64')
url="https://github.com/gragero/OJC-shell"
license=('MIT')
depends=('glibc' 'readline')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gragero/OJC-shell/archive/refs/tags/V2.7.5.tar.gz")
sha256sums=('7ce523ee1f52132774390a107130086b1e5712a5d0e4bee448173016a8a4f735')

build() {
    cd "$srcdir/OJC-shell-$pkgver/src"
    make 
}

package() {
    cd "$srcdir/OJC-shell-$pkgver/src"
    install -Dm755 ojcsh "$pkgdir/usr/bin/ojcsh"
}
