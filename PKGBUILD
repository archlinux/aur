# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nnTensor
_pkgver=1.1.13
pkgname=r-${_pkgname,,}
pkgver=1.1.13
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
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b69c8f186d9d7696a3c538ee5a129b69c06ab944703dc73329ec5fa08351a2f7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
