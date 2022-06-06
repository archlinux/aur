# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=syuzhet
_pkgver=1.0.6
pkgname=r-${_pkgname,,}
pkgver=1.0.6
pkgrel=4
pkgdesc='Extracts Sentiment and Sentiment-Derived Plot Arcs from Text'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-dtt
  r-nlp
  r-rlang
  r-textshape
  r-tidyr
  r-zoo
)
optdepends=(
  r-devtools
  r-knitr
  r-pander
  r-parallel
  r-readxl
  r-rmarkdown
  r-stringr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fbcb68d060bea5452c4ac60b490c8af039fec6e7d3406505e25100be1a662c9a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
