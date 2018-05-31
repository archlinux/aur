# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=testthat
_cranver=2.0.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-testthat
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Unit Testing for R"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-cran-cli' 'r-crayon' 'r-digest' 'r-magrittr' 'r-praise' 'r-rlang' 'r-withr')

optdepends=('r-covr' 'r-devtools' 'r-knitr' 'r-rmarkdown' 'r-xml2')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('36765e0ad2e29b825b4c6088b1a34458')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

