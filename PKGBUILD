# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=mvtnorm
_cranver=1.0-8
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-mvtnorm
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Multivariate Normal and t Distributions"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('4878dd1d83085badaaec1e0f81b27e45')
replaces=('r-cran-mvtnorm')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

