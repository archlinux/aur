# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Ternary
_pkgver=2.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Create Ternary and Holdridge Plots'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-plottools
  r-rcpphungarian
  r-shiny
  r-sp
  r-viridislite
)
optdepends=(
  r-colourpicker
  r-knitr
  r-readxl
  r-rmarkdown
  r-shinyjs
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
