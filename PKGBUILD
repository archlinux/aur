# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=igraph
_cranver=1.2.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-igraph
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Network Analysis and Visualization"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-magrittr' 'r-pkgconfig')

optdepends=('r-ape' 'r-graph' 'r-igraphdata' 'r-rgl' 'r-cran-scales' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('011d2c5a4b85024cbfa48b37b4a9c355')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

