# system requirements: xclip (Linux)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=questionr
_pkgver=0.7.7
pkgname=r-${_pkgname,,}
pkgver=0.7.7
pkgrel=3
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
sha256sums=('ce24c40bd98dbeca615b9eb2a9cd2da26852821dc3840f8394eeecb0739dfd56')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
