# system requirements: xclip (Linux)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=questionr
_pkgver=0.8.2
pkgname=r-${_pkgname,,}
pkgver=0.8.2
pkgrel=1
pkgdesc='Functions to Make Surveys Processing Easier'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  xclip
  r-classint
  r-highr
  r-htmltools
  r-labelled
  r-miniui
  r-rlang
  r-rstudioapi
  r-shiny
  r-styler
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
sha256sums=('37d6364635baa8bb1ca79fc3a1b1a39d3113f7112b6af5834d5f4c3141ebae1a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
