# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CyTOFpower
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
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
sha256sums=('ee68db5acd75b2fa77b2b22184f27de3d46f8292ac1c077edabb9604d6c99828')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
