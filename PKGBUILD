# system requirements: pandoc with https support
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggExtra
_pkgver=0.10.0
pkgname=r-${_pkgname,,}
pkgver=0.10.0
pkgrel=6
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
  r-shinydisconnect
  r-svglite
  r-testthat
  r-vdiffr
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dc6855bbb7e81ffa58d6b65b594d22718fa36b7f50b2284386f70fa8ccc6a3e5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
