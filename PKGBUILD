# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail [dt] com >
pkgname=rocheplot
pkgver=0.1.0
pkgrel=1
pkgdesc="Plot the key stages in the evolution of a binary star"
arch=('i686' 'x86_64')
url="http://rocheplot.sourceforge.net/"
license=('GPL3')
depends=('pgplot' 'libsufr')
makedepends=('cmake' 'gcc-fortran')
changelog=ChangeLog
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz")
sha512sums=('59b1c636d11d2860ab585e83719787cb476ce030d68aa4c6043555c9a63c4d0d8a04e7aaa48a8858aada2ef9067d4625025ac0c9891d97debf62f237d5ceb079')

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
