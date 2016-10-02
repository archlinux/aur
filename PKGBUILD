pkgname=exciting
pkgver=6.6
pkgrel=1
epoch=
pkgdesc="Full-potential all-electron density-functional-theory package
implementing the families of linearized augmented planewave methods."
arch=("x86_64")
url="http://exciting-code.org"
license=("")
groups=()
depends=(blas openmp openmpi)
makedepends=(gcc)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://exciting.wdfiles.com/local--files/carbon/exciting.carbon.tar.gz")
noextract=()
md5sums=("ef5b3e40448df12fcc09b92709780ca2")
validpgpkeys=()

build() {
	cd "$srcdir/exciting"
	cp build/platforms/make.inc.gfortran build/make.inc
	export FCCPP="cpp"
	make
}

package() {
	cd "$srcdir/exciting"
	install -d "$pkgdir/usr/bin"
	cp -r bin/* "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/share/doc/exciting"
	cp -r docs/* "$pkgdir/usr/share/doc/exciting"
}
