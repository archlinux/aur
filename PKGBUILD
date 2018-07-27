# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=1.0.0
pkgname=r-pkgload
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Simulate Package Installation and Attach'
arch=('x86_64')
url='https://cran.r-project.org/package=pkgload'
license=('GPL3')
depends=('r' 'r-desc' 'r-pkgbuild' 'r-rlang' 'r-rprojroot' 'r-rstudioapi' 'r-withr')
optdepends=('r-bitops' 'r-covr' 'r-rcpp' 'r-testthat')
source=("https://cran.r-project.org/src/contrib/pkgload_"$_cranver".tar.gz")
md5sums=('a7681818fcd41b61ab7d00d98f586fdf')

build(){
    R CMD INSTALL pkgload_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership pkgload "$pkgdir"/usr/lib/R/library
}

