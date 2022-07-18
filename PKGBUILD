# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=radiant.data
_pkgver=1.4.3
pkgname=r-${_pkgname,,}
pkgver=1.4.3
pkgrel=1
pkgdesc='Data Menu for Radiant: Business Analytics using R and Shiny'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('AGPL')
depends=(
  r
  r-base64enc
  r-broom
  r-car
  r-curl
  r-dplyr
  r-dt
  r-ggplot2
  r-glue
  r-import
  r-jsonlite
  r-knitr
  r-lubridate
  r-magrittr
  r-markdown
  r-patchwork
  r-plotly
  r-psych
  r-randomizr
  r-readr
  r-readxl
  r-rlang
  r-rmarkdown
  r-rstudioapi
  r-scales
  r-shiny
  r-shinyace
  r-shinyfiles
  r-stringi
  r-tibble
  r-tidyr
  r-writexl
)
optdepends=(
  r-dbi
  r-odbc
  r-pkgdown
  r-rpostgresql
  r-rsqlite
  r-svglite
  r-testthat
  r-webshot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('47e4184593710d74f4002ea225990a11ff51e0e73dfc736379b05f759fe06c4f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
