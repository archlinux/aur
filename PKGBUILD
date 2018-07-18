# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=0.11
pkgname=r-evaluate
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Parsing and Evaluation Tools that Provide More Details than the Default'
arch=('any')
url='https://cran.r-project.org/package=evaluate'
license=('MIT')
depends=('r' 'r-stringr>=0.6.2')
optdepends=('r-testthat' 'r-ggplot2')
source=("https://cran.r-project.org/src/contrib/evaluate_"$_cranver".tar.gz")
md5sums=('62f4299235a3e2d8643fdfd6aee31809')

build(){
    R CMD INSTALL evaluate_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership evaluate "$pkgdir"/usr/lib/R/library
}

