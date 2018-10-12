# Maintainer: Alex Branham <alex.branham@gmail.com>
_cranver=0.12
pkgname=r-evaluate
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Parsing and Evaluation Tools that Provide More Details than the Default'
arch=('any')
url='https://cran.r-project.org/package=evaluate'
license=('MIT')
depends=('r' )
optdepends=('r-testthat' 'r-ggplot2')
source=("https://cran.r-project.org/src/contrib/evaluate_"$_cranver".tar.gz")
md5sums=('82823438e6010cf1319fd2f61295bac2')

build(){
    R CMD INSTALL evaluate_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership evaluate "$pkgdir"/usr/lib/R/library
}

