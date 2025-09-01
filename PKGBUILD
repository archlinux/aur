# system requirements: pandoc with https support
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggExtra
_pkgver=0.11.0
pkgname=r-${_pkgname,,}
pkgver=0.11.0
pkgrel=1
pkgdesc="Add Marginal Histograms to 'ggplot2', and More 'ggplot2' Enhancements"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-colourpicker
  r-ggplot2
  r-gtable
  r-miniui
  r-r6
  r-scales
  r-shiny
  r-shinyjs
  pandoc
)
optdepends=(
  r-devtools
  r-fontquiver
  r-knitr
  r-rmarkdown
  r-rstudioapi
  r-svglite
  r-testthat
  r-vdiffr
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('040c0b763df4aaa5e63be1ab5c76e046e23e1c8ccb8924b6e300482ed5be0ca1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
