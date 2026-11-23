# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nnTensor
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Non-Negative Tensor Decomposition'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-fields
  r-ggplot2
  r-plot3d
  r-rtensor
  r-tagcloud
  r-vicus
)
optdepends=(
  r-dplyr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('54e9ea6d0cbda099bb5342e34860bb4ea7d91e3568bb6053b7d1b1fb8b28beac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
