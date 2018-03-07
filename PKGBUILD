 # Maintainer: Dilawar Singh <dilawar.s.rajput@gmail.com
pkgname=moose
_pkgname=moose
pkgver=3.1.3
pkgrel=1
epoch=
pkgdesc="Multiscale Object Oriented Simulation Environment"
arch=('i686' 'x86_64')
url="https://moose.ncbs.res.in"
license=('GPL')
groups=()
depends=( 'hdf5' 'gsl' 'python-numpy' 'python-matplotlib' )
makedepends=( 'cmake' 'gsl' 'python-numpy' 'python' 'hdf5' )
checkdepends=()
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+https://github.com/BhallaLab/moose.git#branch=chamcham")
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir/$_pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITH_GUI=OFF .
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

check() {
    cd "$srcdir/$_pkgname"
    ctest --output-on-failure
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
}
