# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=echarts4r
_pkgver=0.5.0
pkgname=r-${_pkgname,,}
pkgver=0.5.0
pkgrel=1
pkgdesc="Create Interactive Graphs with 'Echarts JavaScript' Version 5"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-broom
  r-corrplot
  r-countrycode
  r-dplyr
  r-htmltools
  r-htmlwidgets
  r-jsonlite
  r-purrr
  r-rstudioapi
  r-scales
  r-shiny
)
optdepends=(
  r-covr
  r-data.tree
  r-knitr
  r-leaflet
  r-rmarkdown
  r-testthat
  r-tibble
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fcbe73189a13ab345994afb462334a3b11837843d1740f35205d7d1db7b2fbb2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
