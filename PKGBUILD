# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=geometry
_cranver=0.3-6
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-geometry
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Mesh Generation and Surface Tesselation"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL (>= 3) + file LICENSE')
depends=('r' 'r-magic')

optdepends=('r-testthat' 'r-rgl' 'r-r.matlab' 'r-tripack')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('82c05b2b9cf6d36d70472c88aae9dde8')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

