# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinydashboardPlus
_pkgver=2.0.5
pkgname=r-${_pkgname,,}
pkgver=2.0.5
pkgrel=1
pkgdesc="Add More 'AdminLTE2' Components to 'shinydashboard'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fresh
  r-htmltools
  r-lifecycle
  r-shiny
  r-shinydashboard
  r-waiter
)
optdepends=(
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-shinyace
  r-shinyeffects
  r-shinyjqui
  r-shinywidgets
  r-styler
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0bc34cd75f6df1d9c6cb8e7e98e18c5c9c4f739ef54c8d79462597dd1cf3a3cc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
