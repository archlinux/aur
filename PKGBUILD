# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=networkD3
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=0.4.1
pkgrel=1
pkgdesc='D3 JavaScript Network Graphs from R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.tree
  r-htmlwidgets
  r-igraph
  r-magrittr
)
optdepends=(
  r-htmltools
  r-jsonlite
  r-knitr
  r-shiny
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5be36aa5dd3722b1cd52a149c50af2dbef0714b2dab2b4dbf7552c628925f64e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
