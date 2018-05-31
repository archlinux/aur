# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=expm
_cranver=0.999-2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-expm
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Matrix Exponential, Log, etc"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )

optdepends=('r-sfsmisc')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('e05fa3f995754af92bd03227625da984')
replaces=('r-cran-expm')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

