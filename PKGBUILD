# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinydashboardPlus
_pkgver=2.0.3
pkgname=r-${_pkgname,,}
pkgver=2.0.3
pkgrel=4
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
sha256sums=('49a88cfa396f880ff4faf558bb038763084287c932e27b0c9251f4d676584d83')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
