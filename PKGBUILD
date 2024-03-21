# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=shinyWidgets
_pkgver=0.8.3
pkgname=r-${_pkgname,,}
pkgver=0.8.3
pkgrel=1
pkgdesc='Custom Inputs Widgets for Shiny'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-anytime
  r-bslib
  r-htmltools
  r-jsonlite
  r-rlang
  r-sass
  r-shiny
)
optdepends=(
  r-covr
  r-dt
  r-ggplot2
  r-scales
  r-shinydashboard
  r-shinydashboardplus
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('187c43871e3236d3c21e374b78dd26b00e1eaad6dd67133153d4c46a3777e80b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
