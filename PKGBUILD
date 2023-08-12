# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flexdashboard
_pkgver=0.6.2
pkgname=r-${_pkgname,,}
pkgver=0.6.2
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
sha256sums=('b630f33643459594e0b63e52064b31df024cfb0d482d45d54d61db18aecbbe7f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
