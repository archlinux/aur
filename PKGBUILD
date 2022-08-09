# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyWidgets
_pkgver=0.7.2
pkgname=r-${_pkgname,,}
pkgver=0.7.2
pkgrel=1
pkgdesc='Custom Inputs Widgets for Shiny'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bslib
  r-htmltools
  r-jsonlite
  r-sass
  r-shiny
  r-anytime
)
optdepends=(
  r-argondash
  r-argonr
  r-bs4dash
  r-covr
  r-dt
  r-ggplot2
  r-scales
  r-shinydashboard
  r-shinydashboardplus
  r-tablerdash
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f31509f90fcb2cbde8a7f84e500fc10a9171dbffecba660036b8647dbbe4a178')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
