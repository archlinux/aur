# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=rlang
_cranver=0.2.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rlang
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Functions for Base Types and Core R and Tidyverse Features"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' )

optdepends=('r-crayon' 'r-knitr' 'r-cran-pillar' 'r-rmarkdown' 'r-testthat' 'r-covr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('71ba956eb1f40b39f16dd28888753524')
replaces=('r-cran-rlang')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

