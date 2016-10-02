pkgname=psi4-git
pkgver=master
pkgrel=1
epoch=
pkgdesc="Open-source quantum chemistry"
arch=("x86_64")
url="http://psicode.org"
license=("GPL")
groups=()
depends=(blas lapack python2 boost python2-numpy)
makedepends=(gcc cmake)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/psi4/psi4/archive/master.zip")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "$srcdir"
	cmake psi4-master -Bbuild -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/"
	cd build
	make -j 2
}

package() {
	cd "$srcdir/build"
	make install
}
