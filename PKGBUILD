# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bs4Dash
_pkgver=2.3.0
pkgname=r-${_pkgname,,}
pkgver=2.3.0
pkgrel=1
pkgdesc="A 'Bootstrap 4' Version of 'shinydashboard'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bslib
  r-fresh
  r-htmltools
  r-httpuv
  r-httr
  r-jsonlite
  r-lifecycle
  r-shiny
  r-waiter
)
optdepends=(
  r-dt
  r-golem
  r-knitr
  r-rmarkdown
  r-testthat
  r-thematic
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a15480f1cab00e79ec5cadc57a0a329301d1d48502a6d3694c534dfaf165bf25')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
