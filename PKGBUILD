# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=robustbase
_cranver=0.93-1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-robustbase
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Basic Robust Statistics"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-deoptimr')
optdepends=('r-robust' 'r-fit.models' 'r-mpv' 'r-xtable' 'r-ggplot2' 'r-ggally' 'r-rcolorbrewer' 'r-reshape2' 'r-sfsmisc' 'r-catdata' 'r-doparallel' 'r-foreach' 'r-skewt')
makedepends=('gcc-fortran')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('9311aaa97e4ec23b1b6b3b43ce7be072')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

