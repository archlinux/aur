# Maintainer: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=fifechan
pkgver=0.1.5
pkgrel=1
pkgdesc="A C++ GUI library designed for games. It comes with a standard set of 'widgets'."
arch=(any)
url="http://fifengine.github.io/fifechan/"
license=('LGPL2.1')
depends=('sdl2_image' 'glut')
makedepends=('cmake' 'make')
provides=('fifechan')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fifengine/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('713f46ac8310f333c599a17c53e83b43c1e71dc0a631596eae0089877409e48f87fa25ca067734817ca8ddc75ecd7b99ccda227fc29036676a87e441f8aa7d2d')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p build && cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir" install
}
