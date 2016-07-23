# Contributor: MCMic <come.bernigaud@laposte.net>

pkgname=freesiege
pkgver=1.3
pkgrel=2
pkgdesc="a tetris like war game"
arch=('i686' 'x86_64')
url="https://github.com/MCMic/freesiege"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_ttf' 'sdl_mixer')
makedepends=('make' 'cmake')
conflicts=()
source=("https://github.com/MCMic/freesiege/archive/v${pkgver}.tar.gz")
md5sums=('7bb0c6c48890b85847376bf2a7321e5d')

build() {
	cd $srcdir/freesiege-${pkgver}

	cmake -DCOMPILE_FOR_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd $srcdir/freesiege-${pkgver}

	make install DESTDIR=$pkgdir
}
