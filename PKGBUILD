# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail >
pkgname=pg2plplot
pkgver=0.4.1
pkgrel=1
pkgdesc="Assist the transition from PGPlot to PLplot in Fortran programs"
arch=('i686' 'x86_64')
url="http://pg2plplot.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran' 'plplot')
changelog=ChangeLog
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz")
sha512sums=('8f7f544310b495571588ed82cfd295f5533ea68336aa380076b7ee588ce81ad64ec79e217c501055f10aa949292d13688ecbba0c516d609e86d619a9f6fe6780')

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
