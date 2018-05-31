# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=clipr
_cranver=0.4.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-clipr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Read and Write from the System Clipboard"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' )

optdepends=('r-rstudioapi' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('4012a31eb3b7a36bd3bac00f916e56a7')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

