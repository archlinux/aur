# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
pkgname=jasp-rbundle
pkgver=2018.01.14
pkgrel=1
pkgdesc="A bundle of R packages needed by JASP desktop"
url="http://cran.r-project.org/"
arch=('any')
depends=('r' 'r-cran-rcpp')
makedepends=('r' 'gcc-fortran' 'r-cran-rcpp')
source=("rbundle.R")

pkgver() {
	echo $(date +%Y.%m.%d)
}

prepare(){
	mkdir -p $srcdir/usr/lib/JASP/R/library
}

build(){
	cd $srcdir
	_libraryPath=$srcdir/usr/lib/JASP/R/library
	Rscript rbundle.R $_libraryPath
}

package(){
	cp -r $srcdir/usr $pkgdir/
	#mkdir -p $pkgdir/usr/lib/R/library
	#mv $pkgdir/usr/lib/JASP/R/library/RInside $pkgdir/usr/lib/R/library/
	#mv $pkgdir/usr/lib/JASP/R/library/Rcpp $pkgdir/usr/lib/R/library/
}	
md5sums=('31ff4028ced10d1433d39b3b874f1928')
