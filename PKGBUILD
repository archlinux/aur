# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail [dt] com >
pkgname=astrotools
pkgver=0.0.3
pkgrel=1
pkgdesc="Command-line tools for astronomy and astrophysics"
arch=('i686' 'x86_64')
url="http://astrotools.sourceforge.net/"
license=('GPL3')
depends=('libsufr' 'libthesky')
makedepends=('cmake' 'gcc-fortran')
changelog=ChangeLog
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz")
sha512sums=('792f6347062c8530159670a717266e84cc921de0466228e574653378893484d19386c01662f076d5d77fe6eb561b762c657e73470328621246eb0a0f02ac1c2b')

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
