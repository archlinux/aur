# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vissE
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Visualising Set Enrichment Analysis Results'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggforce
  r-ggplot2
  r-ggraph
  r-ggrepel
  r-ggwordcloud
  r-gseabase
  r-igraph
  r-msigdb
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-scales
  r-scico
  r-textstem
  r-tidygraph
  r-tm
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-patchwork
  r-pkgdown
  r-prettydoc
  r-rmarkdown
  r-singscore
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bd156d9bdaae6718c1e2db7433cdc51d8cd642918527a14503e991a7e42687af')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
