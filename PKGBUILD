# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranver=0.14
_cranname=evaluate
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-evaluate
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Parsing and Evaluation Tools that Provide More Details than the Default'
arch=('any')
url='https://cran.r-project.org/package=evaluate'
license=('MIT')
depends=('r' )
optdepends=('r-testthat' 'r-ggplot2')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('8bcf26d1cc5b3f8fc14056ddfebcd295')

build(){
    R CMD INSTALL evaluate_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership evaluate "$pkgdir"/usr/lib/R/library
}

