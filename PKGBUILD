# Maintainer Tyler Brock <tyler@mongodb.com>
# Maintainer monty <linksoft [at] gmx [dot] de>

pkgname=libbson
pkgver=1.3.0
pkgrel=2
pkgdesc='A BSON utility library.'
arch=('i686' 'x86_64')
url='http://www.mongodb.org/display/DOCS/C+Language+Center'
license=('Apache')
makedepends=(python)

source=(https://github.com/mongodb/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('bdc55edf32e33d4991fd210b61a94d18428a58dbcd57294edcf9b7173cd7bdffebf0af75a4b67f1a2e6f5c5816d547310af0c4686ac5dd80fd19dc7690d9e1fc')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh --prefix=/usr --enable-static=yes
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
