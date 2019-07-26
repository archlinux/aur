pkgname=exciting
pkgver=7
pkgrel=1
pkgdesc="Full-potential all-electron density-functional-theory package
implementing the families of linearized augmented planewave methods."
arch=("x86_64")
url="http://exciting-code.org"
license=("GPL")
depends=(gcc-fortran blas openmp openmpi)
source=("http://exciting.wdfiles.com/local--files/nitrogen/exciting.nitrogen.tar.gz")
md5sums=('8447e7b325ce3f00f90c7ab8781b889c')

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
	chmod -R 755 docs
	cp -r docs/* "$pkgdir/usr/share/doc/exciting"
}
