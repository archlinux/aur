# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=later
_cranver=1.0.0
pkgname=r-${_cranname}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Utilities for Scheduling Functions to Execute Later with Event Loops"
arch=('i686' 'x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-rcpp>=0.12.9' 'r-rlang' 'r-bh')
optdepends=('r-knitr' 'r-rmarkdown' 'r-testthat')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('bc8f2d7a016270f60204f1ba1f2c3519')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
