# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=R6
_cranver=2.2.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-r6
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Classes with Reference Semantics"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' )

optdepends=('r-knitr' 'r-microbenchmark' 'r-pryr' 'r-testthat' 'r-ggplot2' 'r-cran-scales')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('635b58c65bff624a1fab69c6b1989801')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

