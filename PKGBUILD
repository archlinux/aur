# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=piano
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=2.14.0
pkgrel=1
pkgdesc='Platform for integrative analysis of omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-dt
  r-fgsea
  r-gplots
  r-htmlwidgets
  r-igraph
  r-marray
  r-relations
  r-scales
  r-shiny
  r-shinydashboard
  r-shinyjs
  r-visnetwork
)
optdepends=(
  r-affy
  r-affyplm
  r-annotationdbi
  r-biocstyle
  r-biomart
  r-gtools
  r-knitr
  r-limma
  r-plier
  r-plotrix
  r-rmarkdown
  r-rsbml
  r-snowfall
  r-yeast2.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a8fd7a1c83007cb5a332cc6be43d2b85d8cc7410682879a2f665f437d22c7881')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
