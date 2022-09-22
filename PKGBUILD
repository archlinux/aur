# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mosaicCore
_pkgver=0.9.2.1
pkgname=r-${_pkgname,,}
pkgver=0.9.2.1
pkgrel=1
pkgdesc='Common Utilities for Other MOSAIC-Family Packages'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-rlang
  r-tidyr
)
optdepends=(
  r-ggformula
  r-mosaic
  r-mosaicdata
  r-nhanes
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b7ce16f20fde1d8a5b1836110e5980fb274504ddae6b9c5c2f4198dc7d09dafa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
