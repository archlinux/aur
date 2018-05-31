# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=haven
_cranver=1.1.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-haven
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Import and Export SPSS, Stata and SAS Files"
arch=('x86_64')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('MIT')
depends=('r' 'r-forcats' 'r-hms' 'r-readr' 'r-tibble')

optdepends=('r-covr' 'r-knitr' 'r-rmarkdown' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('dc4bf0503c1cad72ff82b84591a4dcfc')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

