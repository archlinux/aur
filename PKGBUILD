# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nnTensor
_pkgver=1.1.10
pkgname=r-${_pkgname,,}
pkgver=1.1.10
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
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6370ec9b60c2a454893f1596c99dbd179d2d09c2a0c840f59365f9ffda099b9a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
