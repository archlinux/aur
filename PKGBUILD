# Maintainer Tyler Brock <tyler@mongodb.com>
# Maintainer monty <linksoft [at] gmx [dot] de>

pkgname=libbson
pkgver=1.2.2
pkgrel=1
pkgdesc='A BSON utility library.'
arch=('i686' 'x86_64')
url='http://www.mongodb.org/display/DOCS/C+Language+Center'
license=('Apache')
makedepends=(python)
source=(https://github.com/mongodb/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('aa60e9a30d2bd6fe17488230040188bdc22435a45075546b897ada61a484def97932c995d7b0fd7a5f7c04e6c9fdcdf60fa3b6e76b04c35ebf7635014337e9e5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --enable-man-pages=yes --enable-static=yes
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
