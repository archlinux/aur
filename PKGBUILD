# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mosaicCore
_pkgver=0.9.4.0
pkgname=r-${_pkgname,,}
pkgver=0.9.4.0
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
  r-mosaiccalc
  r-mosaicdata
  r-nhanes
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e25605d787d274eedd3de8584283c20204bcb7b94f4a409461304ce7cd867d6c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
