# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail [dt] com >
pkgname=astrotools
pkgver=0.0.1
pkgrel=2
pkgdesc="Command-line tools for astronomy and astrophysics"
arch=('i686' 'x86_64')
url="http://astrotools.sourceforge.net/"
license=('GPL3')
depends=('libsufr' 'libthesky')
makedepends=('cmake' 'gcc-fortran')
changelog=ChangeLog
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz")
sha512sums=('150903efa945ea68baf4f62419d5d2e21dcc2db9f675267482717daa99b9485dfc65f3d9e3dadb6965abc903bbe2cc7099f1c6c51d5974e623dad0b1419eaa47')

build() {
	mkdir -p "$pkgname-$pkgver"/build
	cd "$pkgname-$pkgver"/build/
	cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr/" ..
	make
}

package() {
	cd "$pkgname-$pkgver"/build/
	make install
}
