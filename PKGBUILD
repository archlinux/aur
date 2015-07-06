# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>
pkgname=singular-factory
pkgver=4.0.2
pkgrel=1
pkgdesc="Computer Algebra System for polynomial computations: factory and libfac"
arch=('i686' 'x86_64')
url="http://www.singular.uni-kl.de/"
license=('GPL')
depends=('gmp' 'ncurses' 'readline' 'ntl')
options=('!strip')
source=(http://www.mathematik.uni-kl.de/ftp/pub/Math/Singular/Factory/factory-$pkgver.tar.gz)

build() {
	cd "$srcdir"/factory-$pkgver

	./configure --prefix=/usr \
		    --libdir=/usr/lib \
		    --includedir=/usr/include/singular \
		    --with-NTL \
		    --with-gmp \
		    --without-omalloc \
		    --without-Singular

	make
}

package() {
	cd "$srcdir"/factory-$pkgver
	make DESTDIR="$pkgdir" install
}

md5sums=('1129260eebdfb26cd3daefe13b542a4d')
