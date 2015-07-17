# Maintainer Tyler Brock <tyler@mongodb.com>
# Maintainer monty <linksoft [at] gmx [dot] de>

pkgname=libbson
pkgver=1.1.9
pkgrel=1
pkgdesc='A BSON utility library.'
arch=('i686' 'x86_64')
url='http://www.mongodb.org/display/DOCS/C+Language+Center'
license=('Apache')
makedepends=(python)
source=(https://github.com/mongodb/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('eba60954ec9f11e118a2ee44b92f78dded71aa599806e3289212c2cba0cdb7e33c3c347afcd4297a6cac1d8502ce2b2d00b3e145a6b77233faf731b2319bcff0')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --enable-man-pages=yes
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
