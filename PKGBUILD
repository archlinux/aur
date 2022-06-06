# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=networkD3
_pkgver=0.4
pkgname=r-${_pkgname,,}
pkgver=0.4
pkgrel=4
pkgdesc='D3 JavaScript Network Graphs from R'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
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
sha256sums=('33b82585f1eec6233303ec14033a703d0b17def441c7a0a67bf7e6764c9c9d0b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
