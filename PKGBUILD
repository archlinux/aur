# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail >
pkgname=pg2plplot
pkgver=5.13.0
pkgrel=1
pkgdesc="Assist the transition from PGPlot to PLplot in Fortran programs"
arch=('i686' 'x86_64')
url="http://pg2plplot.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran' 'plplot')
changelog=ChangeLog
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz")
sha512sums=('38261e2bed8b2700c2b797a6d220a9ede0f18ddfb00260ef1eccfcdf3c7f8bef23918d659927650644e10976a4a7cb7855a01aa6da0b033dace8bb356b141345')

build() {
	mkdir -p "$pkgname-$pkgver"/build
	cd "$pkgname-$pkgver"/build/
	cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr/" ..
	make -j1
}

package() {
	# Install library:
	cd "$pkgname-$pkgver"/build/
	make install
	rm -f $pkgdir/usr/lib/libpg2plplot.a
}
