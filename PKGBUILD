# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=crayon
_cranver=1.3.4
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-crayon
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Colored Terminal Output"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' )

optdepends=('r-mockery' 'r-rstudioapi' 'r-testthat' 'r-withr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('77c7c2906c59a3141306d86c89ffc7d3')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

