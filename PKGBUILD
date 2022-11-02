# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=synergyfinder
_pkgver=3.6.0
pkgname=r-${_pkgname,,}
pkgver=3.6.0
pkgrel=1
pkgdesc='Calculate and Visualize Synergy Scores for Drug Combinations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MPL2')
depends=(
  r
  r-dplyr
  r-drc
  r-furrr
  r-future
  r-ggforce
  r-ggplot2
  r-ggrepel
  r-gstat
  r-kriging
  r-magrittr
  r-metr
  r-mice
  r-nleqslv
  r-pbapply
  r-plotly
  r-purrr
  r-reshape2
  r-sp
  r-spatialextremes
  r-stringr
  r-tidyr
  r-tidyverse
  r-vegan
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3e1c11f6bdbaa79c0468e9e8cb8390924a4e95aac3681b6f2f5f6339366607ac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
