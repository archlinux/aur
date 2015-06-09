# Maintainer: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=fifechan
pkgver=0.1.2
pkgrel=1
pkgdesc="A C++ GUI library designed for games. It comes with a standard set of 'widgets'."
arch=(any)
url="http://fifengine.github.io/fifechan/"
license=('LGPL2.1')
depends=('sdl_image' 'allegro4' 'libgl' 'glut')
makedepends=('cmake' 'make')
provides=('fifechan')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fifengine/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ae58c86acb931a99dd7de21baf2f9cd22ca3b194d80c66622978c1da11cf7e4bcfd50b098b44c1e7f195d5ca270c3a879bfcd257611479575a38859c770d5b07')


build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir -p build && cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/build
	make DESTDIR=$pkgdir install
}
