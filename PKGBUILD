# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=jsonlite
_cranver=1.5
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-jsonlite
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Robust, High Performance JSON Parser and Generator for R"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' )

optdepends=('r-httr' 'r-curl' 'r-plyr' 'r-testthat' 'r-knitr' 'r-rmarkdown' 'r-cran-sp')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('2a81c261a702fccbbd5d2b32df108f76')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

