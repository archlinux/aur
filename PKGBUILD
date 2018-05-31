# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=rstudioapi
_cranver=0.7
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rstudioapi
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Safely Access the RStudio API"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' )

optdepends=('r-testthat' 'r-knitr' 'r-rmarkdown')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('ee4ab567a7a9fdfac1a6fd01fe38de4a')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

