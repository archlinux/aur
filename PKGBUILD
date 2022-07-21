# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyWidgets
_pkgver=0.7.1
pkgname=r-${_pkgname,,}
pkgver=0.7.1
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
sha256sums=('3f753f7611bc4ec014b5bf90bc50cdfde15dc2e55e65407d0733831d6882d6c7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
