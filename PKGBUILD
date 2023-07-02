pkgname=orbiter2016-git
_pkgname=orbiter
pkgver=1.0
pkgrel=1
pkgdesc="Orbiter Space Flight Simulator"
arch=('x86_64')
url="http://orbit.medphys.ucl.ac.uk/index.html"
license=('MIT')
conflicts=()
depends=()
makedepends=('git' 'cmake' 'glfw-x11' 'openal' 'libsndfile' 'glm')
source=(git+https://github.com/TheGondos/orbiter.git#branch=linux)
sha256sums=('SKIP')

build() {
	cd "$srcdir/$_pkgname"
	git submodule update --init --recursive
	rm -rf build
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package () {
 	cd "$srcdir/$_pkgname/build"
 	make DESTDIR="$pkgdir" install
}
