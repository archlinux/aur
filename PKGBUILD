# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=caret
_cranver=6.0-80
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-caret
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Classification and Regression Training"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-ggplot2' 'r-foreach' 'r-plyr' 'r-modelmetrics>=1.1.0' 'r-reshape2' 'r-recipes>=0.0.1' 'r-withr>=2.0.0')

optdepends=('r-bradleyterry2' 'r-e1071' 'r-earth' 'r-fastica' 'r-gam' 'r-ipred' 'r-kernlab' 'r-knitr' 'r-klar' 'r-ellipse' 'r-mda' 'r-mlbench' 'r-mlmetrics' 'r-party' 'r-pls' 'r-proc' 'r-proxy' 'r-randomforest' 'r-rann' 'r-spls' 'r-subselect' 'r-pamr' 'r-superpc' 'r-cubist' 'r-testthat' 'r-dplyr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('997df8c6400ef477f83a905977e40a1b')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

