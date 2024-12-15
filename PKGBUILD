# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=singscore
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Rank-based single-sample gene set scoring method'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocparallel
  r-edger
  r-ggplot2
  r-ggrepel
  r-gseabase
  r-magrittr
  r-matrixstats
  r-plotly
  r-plyr
  r-rcolorbrewer
  r-reshape
  r-reshape2
  r-s4vectors
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-covr
  r-hexbin
  r-knitr
  r-pkgdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1b0e074ab683316323a2f68d201c8d17c1aa9270752dbf50504cf9b921abf7fb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
