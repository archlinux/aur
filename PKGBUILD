# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vissE
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
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
sha256sums=('65b475ef7b3367b257de7ccb861d786e21e9b55f73474a34ce5cd02d1f469b76')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
