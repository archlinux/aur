# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=timeDate
_cranver=3043.102
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-timedate
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Rmetrics - Chronological and Calendar Objects"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )

optdepends=('r-date')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('7808ada851cbf740b1360cabca0706ff')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

