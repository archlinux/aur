# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=xml2
_cranver=1.2.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-xml2
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Parse XML"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )

optdepends=('r-testthat' 'r-curl' 'r-covr' 'r-knitr' 'r-rmarkdown' 'r-magrittr' 'r-httr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('40e31daf2a4a7c36be9b0bb630399a9c')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

