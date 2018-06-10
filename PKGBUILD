# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=stringdist
_cranver=0.9.5.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-stringdist
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Approximate String Matching and String Distance Functions"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' )

optdepends=('r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('a1cf825039e43e36a368e00986396559')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

