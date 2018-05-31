# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=colorspace
_cranver=1.3-2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-colorspace
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Color Space Manipulation"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('BSD')
depends=('r' )

optdepends=('r-kernlab' 'r-mvtnorm' 'r-vcd' 'r-dichromat' 'r-shiny' 'r-shinyjs')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('63000bab81d995ff167df76fb97b2984')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

