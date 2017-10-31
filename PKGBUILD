 # Maintainer: Dilawar Singh <dilawar.s.rajput@gmail.com
pkgname=moose
pkgver=3.1.2
pkgrel=1
epoch=
pkgdesc="Multiscale Object Oriented Simulation Environment"
arch=('i686' 'x86_64')
url="https://moose.ncbs.res.in"
license=('GPL')
groups=()
depends=( 'hdf5' 'gsl' 'libsbml', 'python-numpy', 'python-matplotlib', 'python-network')
makedepends=( 'cmake' 'gsl' 'python-numpy' 'python' 'hdf5' )
checkdepends=()
optdepends=()
provides=("$pkgname")
conflicts=("$pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/BhallaLab/moose.git")
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir/$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
	cd "$srcdir/$pkgname"
	make
}

check() {
    echo "Nothing to do here"
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
