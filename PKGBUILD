# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=prodlim
_cranver=2018.04.18
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-prodlim
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Product-Limit Estimation for Censored Event History Analysis"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-rcpp>=0.11.5' 'r-lava')



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('897e215d6029fc29dcbd9f1c2b757343')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

