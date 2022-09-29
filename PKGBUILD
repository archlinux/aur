# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=visNetwork
_pkgver=2.1.2
pkgname=r-${_pkgname,,}
pkgver=2.1.2
pkgrel=1
pkgdesc="Network Visualization using 'vis.js' Library"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-htmltools
  r-htmlwidgets
  r-jsonlite
  r-magrittr
)
optdepends=(
  r-colourpicker
  r-flashclust
  r-ggraph
  r-igraph
  r-knitr
  r-rmarkdown
  r-rpart
  r-shiny
  r-shinywidgets
  r-sparkline
  r-tidygraph
  r-webshot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('47c99d42fc89e6ae929257b2648d998c5ffed60dff97ad7e47613f5a0c1ddc84')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
