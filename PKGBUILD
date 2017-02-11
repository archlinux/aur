# Maintainer: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=fifechan
pkgver=0.1.4
pkgrel=1
pkgdesc="A C++ GUI library designed for games. It comes with a standard set of 'widgets'."
arch=(any)
url="http://fifengine.github.io/fifechan/"
license=('LGPL2.1')
depends=('sdl2_image' 'allegro4' 'libgl' 'glut')
makedepends=('cmake' 'make')
provides=('fifechan')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fifengine/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('d52833c6c6fdb216f20dc572ad9427d868e1dff58ec1d7f5b0f4d12ea9baef4799399054cead0780fd7dee2eb8c5fdf2c9ccd25965c6522b8bdd12309919a13d')
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
