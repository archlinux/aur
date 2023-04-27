# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidySingleCellExperiment
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
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
)
optdepends=(
  r-biocstyle
  r-celldex
  r-dittoseq
  r-ensdb.hsapiens.v86
  r-ggally
  r-igraph
  r-knitr
  r-markdown
  r-matrix
  r-scater
  r-scran
  r-singlecellsignalr
  r-singler
  r-testthat
  r-tidyheatmap
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c1c5eeb4d7e0f0b1370b42ade1a975192748a91688e5386e7d23e9681d7c6a73')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
