# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=irlba
_cranver=2.3.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-irlba
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Fast Truncated Singular Value Decomposition and Principal Components Analysis for Large Dense and Sparse Matrices"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' )

optdepends=('r-pma')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('f710502b70e97abb9bdf3dba961769ed')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

