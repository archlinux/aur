# Contributor: Julian Leyh <julian@vgai.de>
# Contributor: Rod Kay     <charlie5 on #ada at freenode.net>

pkgname=ahven
pkgver=2.6
pkgrel=1
pkgdesc="Ahven is a simple unit test framework for the Ada programming language."

arch=('i686' 'x86_64')
url="http://ahven.stronglytyped.org/"
license=('BSD')

depends=('gcc-ada')
makedepends=('sphinxcontrib-adadomain')


source=(http://www.ahven-framework.com/releases/ahven-2.6.tar.gz)
md5sums=('776d3da3cd30a9c8d7db1f84f55c8381')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}


check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make  DESTDIR=$pkgdir  PREFIX="$pkgdir/usr"  SPHINXBUILD=sphinx-build2  install
}
