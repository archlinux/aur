# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=formatR
_cranver=1.5
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-formatr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Format R Code Automatically"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )

optdepends=('r-shiny' 'r-testit' 'r-rmarkdown' 'r-knitr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('ac735515b8e4c32097154f1b68c5ecc7')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

