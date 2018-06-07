# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=SparseM
_cranver=1.77
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-sparsem
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Sparse Linear Algebra"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('bb03293245d3d66316dbbb9d0997d4d2')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

