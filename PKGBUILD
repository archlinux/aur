# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=checkmate
_cranver=2.0.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Fast and Versatile Argument Checks"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(BSD3)
depends=('r>=3.0.0' 'r-backports>=1.1.0')
optdepends=(r-r6 r-fastmatch r-data.table r-devtools r-ggplot2 r-knitr r-magrittr r-microbenchmark r-rmarkdown r-testthat r-tinytest r-tibble)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('0dc25b0e20c04836359df1885d099c6e4ad8ae0e585a9e4107f7ea945d9c6fa4')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
