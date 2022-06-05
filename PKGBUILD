# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CyTOFpower
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='Power analysis for CyTOF experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-cytoglmm
  r-diffcyt
  r-dplyr
  r-dt
  r-ggplot2
  r-magrittr
  r-rlang
  r-shiny
  r-shinyfeedback
  r-shinyjs
  r-shinymatrix
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0425c329db951d50486610ff0874dbc9b95a2a7b3107bee5ca75530b23377f36')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
