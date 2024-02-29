# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=datamods
_pkgver=1.4.5
pkgname=r-${_pkgname,,}
pkgver=1.4.5
pkgrel=1
pkgdesc="Modules to Import and Manipulate Data in 'Shiny'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-htmltools
  r-htmlwidgets
  r-phosphoricons
  r-reactable
  r-readxl
  r-rio
  r-rlang
  r-shiny
  r-shinybusy
  r-shinywidgets
  r-tibble
  r-writexl
)
optdepends=(
  r-bslib
  r-jsonlite
  r-knitr
  r-mass
  r-rmarkdown
  r-testthat
  r-validate
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f6bc2a40ad4bf4653e078b4c4859546211e090b4eb26d976492e4f9dffb439e2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
