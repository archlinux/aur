# Maintainer Tyler Brock <tyler@mongodb.com>
# Maintainer monty <linksoft [at] gmx [dot] de>

pkgname=libbson
pkgver=1.1.10
pkgrel=1
pkgdesc='A BSON utility library.'
arch=('i686' 'x86_64')
url='http://www.mongodb.org/display/DOCS/C+Language+Center'
license=('Apache')
makedepends=(python)
source=(https://github.com/mongodb/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('636178bafb19e7b103b5192866dbda0c70b8d7173560b0466f88b3a85cce3292a7caac9521808fa8c09d187f8c96564dcd9fb787e855d1619610f813583379bc')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --enable-man-pages=yes
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
