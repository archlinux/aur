# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=lintr
_cranver=1.0.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-lintr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Linter for R Code"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-rex' 'r-crayon' 'r-stringdist' 'r-testthat' 'r-digest' 'r-igraph' 'r-rstudioapi' 'r-httr' 'r-jsonlite' 'r-knitr')

optdepends=('libxml2' 'glpk' 'r-rmarkdown' 'r-mockery')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('dbbca34d51580857bd22f6b0b54cc9ee')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

