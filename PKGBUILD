# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pRolocGUI
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=2.12.0
pkgrel=1
pkgdesc='Interactive visualisation of spatial proteomics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-colorspace
  r-colourpicker
  r-dplyr
  r-dt
  r-ggplot2
  r-msnbase
  r-proloc
  r-scales
  r-shiny
  r-shinydashboard
  r-shinydashboardplus
  r-shinyhelper
  r-shinyjs
  r-shinywidgets
)
optdepends=(
  r-biocstyle
  r-knitr
  r-prolocdata
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fd152a06b8a47d9129d073b5fc6dddace2046203d6be925e3c58117b441e8954')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
