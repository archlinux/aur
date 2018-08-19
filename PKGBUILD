# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.2.2
pkgname=r-rlang
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Functions for Base Types and Core R and Tidyverse Features'
arch=('x86_64')
url='https://cran.r-project.org/package=rlang'
license=('GPL3')
depends=('r' )
optdepends=('r-crayon' 'r-knitr' 'r-pillar' 'r-rmarkdown' 'r-testthat' 'r-covr')
replaces=('r-cran-rlang')
source=("https://cran.r-project.org/src/contrib/rlang_"$_cranver".tar.gz")
md5sums=('df2abf3a1936c503ed1edd4350ffb5f0')

build(){
    R CMD INSTALL rlang_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership rlang "$pkgdir"/usr/lib/R/library
}

