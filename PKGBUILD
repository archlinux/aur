# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CyTOFpower
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
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
sha256sums=('320c063938888babd0804ee9690319d9cb1bc54d79c51e856e73c3127b12663c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
