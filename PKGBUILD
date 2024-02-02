# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=schex
_pkgver=1.16.1
pkgname=r-${_pkgname,,}
pkgver=1.16.1
pkgrel=1
pkgdesc='Hexbin plots for single cell omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-concaveman
  r-dplyr
  r-entropy
  r-ggforce
  r-ggplot2
  r-hexbin
  r-scales
  r-seurat
  r-shiny
  r-singlecellexperiment
)
optdepends=(
  r-covr
  r-ggrepel
  r-igraph
  r-isee
  r-knitr
  r-rmarkdown
  r-scater
  r-scran
  r-shinydashboard
  r-tenxpbmcdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('635951df732186ae83134cf55cab7be75a7d9c8d2e353b5b9cc023d38006caad')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
