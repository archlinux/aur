# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail >
pkgname=pg2plplot
pkgver=5.13.1
pkgrel=1
pkgdesc="Assist the transition from PGPlot to PLplot in Fortran programs"
arch=('i686' 'x86_64')
url="http://pg2plplot.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran' 'plplot')
changelog=ChangeLog
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz")
sha512sums=('d594630b1154b56009ed9b8f97b2d4e9d401ce06387954eda05e04de230586965b3868fd7a257a8628e53ac1624092850bfa4ccf0e8238daecfc40c3bc6af03c')

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
