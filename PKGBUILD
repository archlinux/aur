# Maintainer Tyler Brock <tyler@mongodb.com>
# Maintainer monty <linksoft [at] gmx [dot] de>

pkgname=libbson
pkgver=1.2.1
pkgrel=1
pkgdesc='A BSON utility library.'
arch=('i686' 'x86_64')
url='http://www.mongodb.org/display/DOCS/C+Language+Center'
license=('Apache')
makedepends=(python)
source=(https://github.com/mongodb/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('e4e3cd24a210c81448940c0d04ec45a019a2258e2dbe9df1b4dc25dd760a29711ca0f5b43c19a8d2231cf1732c8a6f8fb974ef406586e7e5a223362d5a0b0265')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --enable-man-pages=yes --enable-static=yes
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
