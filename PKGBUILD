# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail [dt] com >
pkgname=astrotools
pkgver=0.0.3
pkgrel=2
pkgdesc="Command-line tools for astronomy and astrophysics"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://astrotools.sourceforge.net/"
license=('GPL3')
depends=('libsufr' 'libthesky')
makedepends=('cmake' 'gcc-fortran')
changelog=ChangeLog
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz")
sha512sums=('7c1f1aa62b038e69bb2699a8808ca08675bc8e4bcfb0bdea93dff1a4954b82665a8f30ac90c0c971b1cb25fd78a4b6a75854f16c2ee937d408042c860f80cc63')

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
