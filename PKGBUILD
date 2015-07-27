# Maintainer: AstroFloyd  < AstroFloyd [at] gmail [dt] com >
pkgname=libthesky
pkgver=0.3.2
pkgrel=2
pkgdesc="Fortran library to compute the positions of celestial bodies and events with great accuracy"
arch=('i686' 'x86_64')
url="http://libthesky.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran' 'libsufr')
changelog=ChangeLog
source=("http://sourceforge.net/projects/libthesky/files/$pkgname-$pkgver.tar.gz")
sha512sums=('64fae18cf410c37d6bda5d65f8890a045734fa3bbaa23c76a8080ef06e15443af5159baf779b69594e24bb1fc8b0719ba03174764d46abed66f61750e8e9e68e')

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
