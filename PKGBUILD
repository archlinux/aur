# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=ipred
_cranver=0.9-6
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-ipred
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Improved Predictors"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-prodlim')

optdepends=('r-mvtnorm' 'r-mlbench' 'r-th.data')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('90676d45838b14249eaeba6df2be65cc')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

