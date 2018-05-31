# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=evaluate
_cranver=0.10.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-evaluate
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Parsing and Evaluation Tools that Provide More Details than the Default"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-stringr')

optdepends=('r-testthat' 'r-ggplot2')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('1dde5a35e2b9d57f1b1bb16791b35ff5')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

