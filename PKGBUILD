# Contributor: MCMic <come.bernigaud@laposte.net>

pkgname=freesiege
pkgver=1.2
pkgrel=1
pkgdesc="a tetris like war game"
arch=('i686' 'x86_64')
url="https://github.com/MCMic/freesiege"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_ttf')
makedepends=('make' 'cmake')
conflicts=()
source=("https://github.com/MCMic/freesiege/archive/v${pkgver}.tar.gz")
md5sums=('b0a2cc4ce8d59e6c5e17778a28973a8e')

build() {
	cd $srcdir/freesiege

	cmake -DCOMPILE_FOR_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd $srcdir/freesiege

	make install DESTDIR=$pkgdir
}
