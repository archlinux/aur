# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=2.3.0
pkgname=r-r6
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Classes with Reference Semantics'
arch=('any')
url='https://cran.r-project.org/package=R6'
license=('MIT')
depends=('r' )
optdepends=('r-knitr' 'r-microbenchmark' 'r-pryr' 'r-testthat' 'r-ggplot2' 'r-scales')
source=("https://cran.r-project.org/src/contrib/R6_"$_cranver".tar.gz")
md5sums=('92c91e7bc5c0309108ba9b0f54f9ed9b')

build(){
    R CMD INSTALL R6_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership R6 "$pkgdir"/usr/lib/R/library
}

