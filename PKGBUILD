# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ruv
_pkgver=0.9.7.1
pkgname=r-${_pkgname,,}
pkgver=0.9.7.1
pkgrel=4
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
sha256sums=('a0c54e56ba3d8f6ae178ae4d0e417a79295abf5dcb68bbae26c4b874734d98d8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
