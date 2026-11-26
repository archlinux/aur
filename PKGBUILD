# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VennDetail
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='A package for visualization and extract details'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-dt
  r-ggplot2
  r-gridextra
  r-htmlwidgets
  r-magrittr
  r-patchwork
  r-plotly
  r-purrr
  r-rlang
  r-shiny
  r-tibble
  r-tidyr
)
optdepends=(
  r-knitr
  r-markdown
  r-rcolorbrewer
  r-rmarkdown
  r-rstudioapi
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('36c0f62302b1bec8094c79c33cb729dd62e6d9c4c8602253c95e189f44765c8d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
