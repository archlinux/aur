# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail >
pkgname=libsufr
pkgver=0.7.0
pkgrel=1
pkgdesc="A LIBrary containing Some Useful Fortran Routines"
arch=('i686' 'x86_64')
url="http://libsufr.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran')
changelog=ChangeLog
source=("http://sourceforge.net/projects/libsufr/files/$pkgname-$pkgver.tar.gz")
sha512sums=('8c884dd55c0ba4f96ae1bd4939ea5c98f9c51f7543e896b15066d61f67c70cf69bf814404d3107f34902d9225a896337e5df65b57fccde503766d5d89398dc6d')

build() {
	mkdir -p "$pkgname-$pkgver"/build
	cd "$pkgname-$pkgver"/build/
	cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr/" ..
	make
}

package() {
	# Install library:
	cd "$pkgname-$pkgver"/build/
	make install
}
