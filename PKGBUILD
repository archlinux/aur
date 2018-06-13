# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=robustbase
_cranver=0.93-0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-robustbase
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Basic Robust Statistics"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'gcc-fortran' 'r-deoptimr')

optdepends=('r-robust' 'r-fit.models' 'r-mpv' 'r-xtable' 'r-ggplot2' 'r-ggally' 'r-rcolorbrewer' 'r-reshape2' 'r-sfsmisc' 'r-catdata' 'r-doparallel' 'r-foreach' 'r-skewt')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('532028dbc82bc3d2903ba667fd989bfa')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

