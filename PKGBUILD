# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=debugme
_cranver=1.1.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-debugme
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Debug R Packages"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-crayon')

optdepends=('r-covr' 'r-mockery' 'r-testthat' 'r-withr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('0b7946be7d9420c63a4d02a937e46227')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

