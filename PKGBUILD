# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nnTensor
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=3
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
  r-dplyr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9105a7c9ae648b6dd3f7c346573d5b16364c80a1ac2ffd32107c3b75c3c4deaa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
