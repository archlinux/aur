# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidySingleCellExperiment
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Brings SingleCellExperiment to the Tidyverse'
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
  r-singlecellexperiment
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
  r-celldex
  r-dittoseq
  r-ggally
  r-igraph
  r-knitr
  r-rmarkdown
  r-scater
  r-scran
  r-singlecellsignalr
  r-singler
  r-testthat
  r-tidyheatmap
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d9d17a1c0f1ab8a2eb7ce4e8c31ad37200069267f992b5f67b9a759862d48120')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
