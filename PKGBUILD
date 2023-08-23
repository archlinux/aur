# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pals
_pkgver=1.8
pkgname=r-${_pkgname,,}
pkgver=1.8
pkgrel=1
pkgdesc='Color Palettes, Colormaps, and Tools to Evaluate Them'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-colorspace
  r-dichromat
  r-mapproj
  r-maps
)
optdepends=(
  r-classint
  r-ggplot2
  r-knitr
  r-latticeextra
  r-reshape2
  r-rgl
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0b52dfccd8b2b04b0e30bdcd72c790ac652c35024ed21f77d77cac83e79ed47c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
