# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.2.2
pkgname=r-igraph
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Network Analysis and Visualization'
arch=('x86_64')
url='https://cran.r-project.org/package=igraph'
license=('GPL')
depends=('r' 'r-magrittr' 'r-pkgconfig>=2.0.0')
optdepends=('r-ape' 'r-digest' 'r-graph' 'r-igraphdata' 'r-rgl' 'r-scales' 'r-testthat')
source=("https://cran.r-project.org/src/contrib/igraph_"$_cranver".tar.gz")
md5sums=('dd2704f842cc19241c4aa3a4ec3a66f3')

build(){
    R CMD INSTALL igraph_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership igraph "$pkgdir"/usr/lib/R/library
}

