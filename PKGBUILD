# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.9-7
pkgname=r-ipred
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Improved Predictors'
arch=('x86_64')
url='https://cran.r-project.org/package=ipred'
license=('GPL')
depends=('r' 'r-prodlim')
optdepends=('r-mvtnorm' 'r-mlbench' 'r-th.data')
source=("https://cran.r-project.org/src/contrib/ipred_"$_cranver".tar.gz")
md5sums=('99613c15d6ff4c4fd42644de48c05c20')

build(){
    R CMD INSTALL ipred_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership ipred "$pkgdir"/usr/lib/R/library
}

