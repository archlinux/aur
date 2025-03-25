# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CyTOFpower
_pkgver=1.12.1
pkgname=r-${_pkgname,,}
pkgver=1.12.1
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
sha256sums=('ae5b2f142d2421f0bfdda6e21a808a9381ac67d7d744f6cabc762419ef3b1eff')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
