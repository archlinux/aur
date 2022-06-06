# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fresh
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=0.2.0
pkgrel=4
pkgdesc="Create Custom 'Bootstrap' Themes to Use in 'Shiny'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-htmltools
  r-rstudioapi
  r-sass
  r-shiny
)
optdepends=(
  r-bs4dash
  r-covr
  r-knitr
  r-rmarkdown
  r-shinydashboard
  r-shinywidgets
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a92db254ae88e8371efac44efe2cf1f5be7cce62291fdf994ebd68c14dad079d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
