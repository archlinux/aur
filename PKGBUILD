# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=lava
_cranver=1.6.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-lava
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Latent Variable Models"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-numderiv' 'r-squarem')

optdepends=('r-rgraphviz' 'r-ascii' 'r-data.table' 'r-ellipse' 'r-fields' 'r-foreach' 'r-geepack' 'r-gof' 'r-graph' 'r-igraph' 'r-lava.tobit' 'r-lme4' 'r-mets' 'r-optimx' 'r-quantreg' 'r-rgl' 'r-testthat' 'r-visnetwork' 'r-zoo')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('93e3fc8f05536f34c68c09018a801fe0')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

