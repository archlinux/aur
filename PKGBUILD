# Maintainer: AstroFloyd  < AstroFloyd [at] gmail [dt] com >
pkgname=libthesky
pkgver=0.3.3
pkgrel=2
pkgdesc="Fortran library to compute the positions of celestial bodies and events with great accuracy"
arch=('i686' 'x86_64')
url="http://libthesky.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs' 'libsufr' 'libthesky-data')
makedepends=('cmake' 'gcc-fortran' 'libsufr')
changelog=ChangeLog
source=("http://sourceforge.net/projects/libthesky/files/$pkgname-$pkgver.tar.gz")
sha512sums=('f7180fdce4a28f6b09393c7b4676a293b145cea8f9993c309c4105dd2928c42fe842985cc905033c9f1b7626b50417005250bce11b1c60d3d6c91f03d7c79bcb')

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
