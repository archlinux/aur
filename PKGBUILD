# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flexdashboard
_pkgver=0.6.1
pkgname=r-${_pkgname,,}
pkgver=0.6.1
pkgrel=1
pkgdesc='R Markdown Format for Flexible Dashboards'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-bslib
  r-htmltools
  r-htmlwidgets
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-sass
  r-scales
  r-shiny
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b4975d44ee97ed0fa2387fd55a6cfa2dfe636c8bc1f46e0617afe1a14954b4d3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
