# Maintainer: AstroFloyd  < AstroFloyd [at] gmail [dt] com >
pkgname=libthesky
pkgver=0.3.3
pkgrel=1
pkgdesc="Fortran library to compute the positions of celestial bodies and events with great accuracy"
arch=('i686' 'x86_64')
url="http://libthesky.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran' 'libsufr')
changelog=ChangeLog
source=("http://sourceforge.net/projects/libthesky/files/$pkgname-$pkgver.tar.gz")
sha512sums=('179ab67b289208363a77a639924b3c8c04ae5af0c4b0a1b2adb1f0ce7c1386da3f6138065c4de1f93f9c679733ba25d9d74c1a53cc5733df5531a45b6b6d25ca')

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
