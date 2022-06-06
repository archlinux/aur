# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mixOmics
_pkgver=6.20.0
pkgname=r-${_pkgname,,}
pkgver=6.20.0
pkgrel=1
pkgdesc='Omics Data Integration Project'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-corpcor
  r-dplyr
  r-ellipse
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-igraph
  r-matrixstats
  r-rarpack
  r-rcolorbrewer
  r-reshape2
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rgl
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('871f11604dd4e1923fc107a4c3df083ff41b8feb7332f765940bc8ec0e178c3b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
