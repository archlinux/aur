pkgname=ojcsh
pkgver=2.3.0
pkgrel=1
pkgdesc="A lightweight, minimal, and extensible Unix-like shell written in pure C — first building block of OJclicks OS"
keywords=('shell' 'unix' 'c' 'terminal' 'cli' 'ojclicks' 'lightweight' 'minimal' 'bash' 'os' 'linux' 'term')
arch=('x86_64')
url="https://github.com/gragero/OJC-shell"
license=('MIT')
depends=('glibc' 'readline')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gragero/OJC-shell/archive/refs/tags/V2.3.0.tar.gz")
sha256sums=('f8ba70e1425a916edd0823ffa6eb6df3aef41b9a4e82b0920b06a3d5a05dc116')

build() {
    cd "$srcdir/OJC-shell-$pkgver"
    gcc -o ojcsh main.c -lreadline 
}

package() {
    cd "$srcdir/OJC-shell-$pkgver"
    install -Dm755 ojcsh "$pkgdir/usr/bin/ojcsh"
}
