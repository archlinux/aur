# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=highcharter
_pkgver=0.9.5
pkgname=r-${_pkgname,,}
pkgver=0.9.5
pkgrel=1
pkgdesc="A Wrapper for the 'Highcharts' Library"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-broom
  r-dplyr
  r-htmltools
  r-htmlwidgets
  r-igraph
  r-jsonlite
  r-lubridate
  r-magrittr
  r-purrr
  r-quantmod
  r-rjson
  r-rlang
  r-rlist
  r-stringr
  r-tibble
  r-tidyr
  r-xts
  r-yaml
  r-zoo
)
optdepends=(
  r-covr
  r-forecast
  r-gapminder
  r-geojsonio
  r-ggplot2
  r-httr
  r-knitr
  r-mass
  r-rmarkdown
  r-shiny
  r-spelling
  r-survival
  r-testthat
  r-viridislite
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c52d3146522aac45afa9ca89622516bf5eacbc6ef684301c049aa110b7dac452')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
