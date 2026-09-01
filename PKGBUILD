# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ruv
_pkgver=0.9.7.2
pkgname=r-${_pkgname,,}
pkgver=0.9.7.2
pkgrel=1
pkgdesc='Detect and Remove Unwanted Variation using Negative Controls'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-gridextra
  r-scales
)
optdepends=(
  r-colourpicker
  r-shiny
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('83556e1a9257b0f2b1e8bbf8eb770ed8224f6f44f8e4308c6296ab4f5c473d23')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
