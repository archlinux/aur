# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.1.0
pkgname=r-ps
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='List, Query, Manipulate System Processes'
arch=('x86_64')
url='https://cran.r-project.org/package=ps'
license=('BSD')
depends=('r' )
optdepends=('r-callr' 'r-covr' 'r-processx' 'r-r6' 'r-rlang' 'r-testthat' 'r-tibble')
source=("https://cran.r-project.org/src/contrib/ps_"$_cranver".tar.gz")
md5sums=('50ca1f0d770f10e76d7a406cdaa95b79')

build(){
    R CMD INSTALL ps_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership ps "$pkgdir"/usr/lib/R/library
}

