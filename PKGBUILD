# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=memoise
_cranver=1.1.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-memoise
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Memoisation of Functions"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-digest')

optdepends=('r-testthat' 'r-aws.s3' 'r-httr' 'r-covr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('493209ee04673f0fcab473c3dd80fb8c')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

