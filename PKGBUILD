# system requirements: xclip (Linux)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=questionr
_pkgver=0.7.8
pkgname=r-${_pkgname,,}
pkgver=0.7.8
pkgrel=1
pkgdesc='Functions to Make Surveys Processing Easier'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-classint
  r-highr
  r-htmltools
  r-labelled
  r-miniui
  r-rstudioapi
  r-shiny
  r-styler
  xclip
)
optdepends=(
  r-dplyr
  r-forcats
  r-ggplot2
  r-hmisc
  r-janitor
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-survey
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('af72e59fe652c6063282a7e5b0f487993b9361cc9ed052a632d64a5a6db76ba9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
