# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=checkmate
_cranver=1.9.4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Fast and Versatile Argument Checks"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(BSD3)
depends=('r>=3.0.0' 'r-backports>=1.1.0')
makedepends=(gcc)
optdepends=(r-r6 r-bit r-fastmatch r-data.table r-devtools r-ggplot2 r-knitr r-magrittr r-microbenchmark r-rmarkdown r-testthat r-tibble)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('cf2ea3fc2426cf6f7fd402322bf82b4b')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
