# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
pkgname=jasp-rbundle
pkgver=2017.06.04
pkgrel=1
pkgdesc="A bundle of R packages needed by JASP desktop"
url="http://cran.r-project.org/"
arch=('any')
depends=('r')
makedepends=('r' 'gcc-fortran')
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
md5sums=('ff779a8742c48bfa73eb4c0423f79cbb')
