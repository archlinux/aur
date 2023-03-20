# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidySummarizedExperiment
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=1.8.1
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
  r-plotly
  r-purrr
  r-rlang
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
  r-vctrs
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b86793aa34cfa9dae50169719eb3e04b5290dd0eb03d48b9d4510bf7053a3eeb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
