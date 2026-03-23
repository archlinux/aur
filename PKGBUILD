pkgname=ojcsh
pkgver=2.2.0
pkgrel=1
pkgdesc="A lightweight, minimal, and extensible Unix-like shell written in pure C — first building block of OJclicks OS"
arch=('x86_64')
url="https://github.com/gragero/OJC-shell"
license=('MIT')
depends=('glibc' 'readline')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gragero/OJC-shell/archive/refs/tags/V2.2.0.tar.gz")
sha256sums=('faa7af3251df91e157b4526929397f74dcc7a16edc2da50436494853aeb688e5')

build() {
    cd "$srcdir/OJC-shell-$pkgver"
    gcc -o OJCsh main.c -lreadline 
}

package() {
    cd "$srcdir/OJC-shell-$pkgver"
    install -Dm755 OJCsh "$pkgdir/usr/bin/OJCsh"
}
