# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=1.0.1
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
md5sums=('800ae9d55b138128c2e71d9be8a833d4')

build(){
    R CMD INSTALL pkgload_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership pkgload "$pkgdir"/usr/lib/R/library
}

