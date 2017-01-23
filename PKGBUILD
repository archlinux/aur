# Maintainer: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=fifechan
pkgver=0.1.3
pkgrel=1
pkgdesc="A C++ GUI library designed for games. It comes with a standard set of 'widgets'."
arch=(any)
url="http://fifengine.github.io/fifechan/"
license=('LGPL2.1')
depends=('sdl2_image' 'allegro4' 'libgl' 'glut')
makedepends=('cmake' 'make')
provides=('fifechan')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fifengine/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('52e6c3fad7c4692527185b575a8360964f2aa20259fd5fc42b42791e126932c976fc2c90b01984e75355aafae72c82d69b4945133b434665b0e6e29249b541d8')

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
