# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=readxl
_cranver=1.1.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-readxl
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Read Excel Files"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-cellranger' 'r-tibble')

optdepends=('r-covr' 'r-knitr' 'r-rmarkdown' 'r-rprojroot' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('0537e13fae3fc490b2fd1bf44c0dad9b')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

