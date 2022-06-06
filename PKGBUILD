# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rngtools
_pkgver=1.5.2
pkgname=r-${_pkgname,,}
pkgver=1.5.2
pkgrel=4
pkgdesc='Utility Functions for Working with Random Number Generators'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-digest
)
optdepends=(
  r-covr
  r-runit
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7f8c76ca4c7851b69a86e27be09b02ddc86357f0388659ef8787634682e8a74d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
