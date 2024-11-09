# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidySummarizedExperiment
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Brings SummarizedExperiment to the Tidyverse'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cli
  r-dplyr
  r-ellipsis
  r-fansi
  r-ggplot2
  r-lifecycle
  r-magrittr
  r-pillar
  r-pkgconfig
  r-plotly
  r-purrr
  r-rlang
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
  r-ttservice
  r-vctrs
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('87b13f2d9a5a1aac01d94b68644500d09004052179002246a0ff78a374935242')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
