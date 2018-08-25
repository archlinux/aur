pkgname=unmakeself
pkgver=1.1
pkgrel=0
pkgdesc="Makeself archive extractor"
arch=('x86_64')
url="https://www.freshports.org/archivers/unmakeself"
license=('BSD')
makedepends=()
depends=(libarchive)
source=("http://www.gtlib.gatech.edu/pub/gentoo/distfiles/$pkgname-$pkgver.tar.gz")
sha384sums=('ca44712541e1df15e6755b35449df73aace4d8a1bdf9a3e6ffb0cbbf8e47e0b3ae6d3542cef8d722622362c52d97aa66')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cc $(pkg-config --cflags --libs libarchive) -Wall -Wextra -o unmakeself unmakeself.c
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m755 unmakeself -t "$pkgdir/usr/bin/"
}
