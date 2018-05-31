# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=assertthat
_cranver=0.2.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-assertthat
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Easy Pre and Post Assertions"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' )

optdepends=('r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('8134f0072c6a84fd738d3bfc5e7f68ef')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

