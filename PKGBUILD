# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=RcppRoll
_cranver=0.3.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rcpproll
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Efficient Rolling / Windowed Operations"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-rcpp')

optdepends=('r-zoo' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('20b1dca034a1d18f63c07201736943c7')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

