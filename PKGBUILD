# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=httr
_cranver=1.3.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-httr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for Working with URLs and HTTP"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-jsonlite' 'r-mime' 'r-curl' 'r-openssl')

optdepends=('r-httpuv' 'r-jpeg' 'r-knitr' 'r-png' 'r-testthat' 'r-readr' 'r-xml2' 'r-rmarkdown' 'r-covr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('5acfb6b2a6f2f26cd6dfad0458fe3351')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

