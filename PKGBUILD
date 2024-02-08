# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=datamods
_pkgver=1.4.4
pkgname=r-${_pkgname,,}
pkgver=1.4.4
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
sha256sums=('58b272eceeb2f3d9ecd3d1b3ddb67496c7dc81d409a56e04fcb673360cf42cca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
