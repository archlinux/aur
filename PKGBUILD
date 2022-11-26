# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyjqui
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=0.4.1
pkgrel=7
pkgdesc="'jQuery UI' Interactions and Effects for Shiny"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-htmltools
  r-htmlwidgets
  r-jsonlite
  r-rlang
  r-shiny
)
optdepends=(
  r-ggplot2
  r-highcharter
  r-knitr
  r-markdown
  r-plotly
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('611f11b5a77fad6f738810dbad76fc211b1636c0754f0aecba6679afcfe7af8c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
