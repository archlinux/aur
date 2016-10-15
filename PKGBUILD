pkgname=abctab2ps
pkgver=1.8.12
pkgrel=1
pkgdesc="ABC notation editor"
groups=(abc)
source=(http://www.lautengesellschaft.de/cdmm/${pkgname}-${pkgver}.tar.gz)
url="http://www.lautengesellschaft.de/cdmm/"
sha256sums=('265d027d24f0edb53e897bc3850de15bc381dbdaf3ac527ce8981cc97a6595df')
arch=('i686' 'x86_64')
license=('GPL')

build() {
	cd $srcdir/$pkgname-$pkgver/src
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver/src
	mkdir -p $pkgdir/usr/bin
	make PREFIX="$pkgdir/usr" docdir=$pkgdir/usr/share/doc install
}
