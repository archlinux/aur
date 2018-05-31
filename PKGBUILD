# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=magrittr
_cranver=1.5
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-magrittr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Forward-Pipe Operator for R"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' )

optdepends=('r-testthat' 'r-knitr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('e74ab7329f2b9833f0c3c1216f86d65a')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

