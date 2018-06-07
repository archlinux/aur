# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=openxlsx
_cranver=4.1.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-openxlsx
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Read, Write and Edit XLSX Files"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-zip')

optdepends=('r-knitr' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('5fdee62e96b0d176419cacb5f7a6e125')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

