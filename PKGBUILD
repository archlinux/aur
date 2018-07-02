# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.6.2
pkgname=r-lava
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Latent Variable Models'
arch=('any')
url='https://cran.r-project.org/package=lava'
license=('GPL3')
depends=('r' 'r-numderiv' 'r-squarem')
optdepends=('r-rgraphviz' 'r-ascii' 'r-data.table' 'r-ellipse' 'r-fields' 'r-foreach' 'r-geepack' 'r-gof' 'r-graph' 'r-igraph' 'r-lava.tobit' 'r-lme4' 'r-mets' 'r-optimx' 'r-polycor' 'r-quantreg' 'r-rgl' 'r-testthat' 'r-visnetwork' 'r-zoo')
source=("https://cran.r-project.org/src/contrib/lava_"$_cranver".tar.gz")
md5sums=('2ad4da587d37318620b6d764fe791c76')

build(){
    R CMD INSTALL lava_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -d "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership lava "$pkgdir"/usr/lib/R/library
}

