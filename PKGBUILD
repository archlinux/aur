# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=3.2.0
pkgname=r-processx
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Execute and Control System Processes'
arch=('x86_64')
url='https://cran.r-project.org/package=processx'
license=('MIT')
depends=('r' 'r-assertthat' 'r-crayon' 'r-ps' 'r-r6')
optdepends=('r-callr' 'r-covr' 'r-debugme' 'r-testthat' 'r-withr')
source=("https://cran.r-project.org/src/contrib/processx_"$_cranver".tar.gz")
md5sums=('29ee94b1792e317623bcecee7124371d')

build(){
    R CMD INSTALL processx_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership processx "$pkgdir"/usr/lib/R/library
}

