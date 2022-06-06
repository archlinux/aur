# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidySingleCellExperiment
_pkgver=1.6.3
pkgname=r-${_pkgname,,}
pkgver=1.6.3
pkgrel=3
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
sha256sums=('f6f01dfa9187dbeacbbc70f30fa0c3d75d4bc91515c1896043cedd1c75b220ad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
