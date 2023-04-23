# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vissE
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=2
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
sha256sums=('0821e26061f0bb0f84c834bffabb8bf38c733c67392f5c29958375ac37cecdf1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
