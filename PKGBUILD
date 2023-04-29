# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Spaniel
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Spatial Transcriptomics Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-dropletutils
  r-ggplot2
  r-igraph
  r-jpeg
  r-jsonlite
  r-magrittr
  r-png
  r-s4vectors
  r-scater
  r-scran
  r-seurat
  r-shiny
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-devtools
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dc31b19b6fa1bc158ca07efe749cb30634f4e49e5447b26f76102caabc7b689d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
