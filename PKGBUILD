# Maintainer: Bernardo Ferrari Mendonca <bernardo.mferrari@gmail.com>
pkgname=tarberd-units-git
pkgver=2.3.2
pkgrel=1
pkgdesc="A fork from the C++ units lib from nholthaus"
arch=('any')
url="http://nholthaus.github.io/units/"
license=('MIT')
makedepends=('cmake')
source=('git+http://github.com/tarberd/units.git#branch=master')
md5sums=('SKIP')


build() {
	cd units
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

check() {
    cd units
    cd unitTests
    ./unitLibTest
}

package() {
	cd "units"
	make DESTDIR="$pkgdir/" install
}
