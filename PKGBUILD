# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nnTensor
_pkgver=1.1.7
pkgname=r-${_pkgname,,}
pkgver=1.1.7
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
sha256sums=('63542be2274ef490086b5f45ef1ff9d491b38518b7912eebf2379892c4548ee7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
