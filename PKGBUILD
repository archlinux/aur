# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=htmltools
_cranver=0.4.0
pkgname=r-htmltools
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for HTML"
arch=('i686' 'x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r>=2.14.1' 'r-digest' 'r-rcpp' 'r-rlang')
optdepends=('r-markdown' 'r-testthat' 'r-withr')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('af44a5dcbc6231eef324026ac0b95c32')

build(){
    cd "${srcdir}"

    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
    cd "${srcdir}"

    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
