# Maintainer Tyler Brock <tyler@mongodb.com>
# Maintainer monty <linksoft [at] gmx [dot] de>

pkgname=libbson
pkgver=1.1.11
pkgrel=1
pkgdesc='A BSON utility library.'
arch=('i686' 'x86_64')
url='http://www.mongodb.org/display/DOCS/C+Language+Center'
license=('Apache')
makedepends=(python)
source=(https://github.com/mongodb/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('600bc0064e02b6f01555b462e9f0ca3e3fc7230e91e515bb4f89f191a438977fdb8155f1b1b5f10fa63243a8d2eecea9c11b500969d6dd85f089606cd1579fdb')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --enable-man-pages=yes --enable-static=yes
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
