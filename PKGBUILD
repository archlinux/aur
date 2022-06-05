# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coRdon
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Codon Usage Analysis and Prediction of Gene Expressivity'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biostrings
  r-data.table
  r-dplyr
  r-ggplot2
  r-purrr
  r-stringr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e2da603bd0dd1991d9dabe8f722bd4a5f50fa8caafdefb6b42b962bed6343cce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
