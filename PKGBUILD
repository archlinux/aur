# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Matching
_pkgver=4.10-8
pkgname=r-${_pkgname,,}
pkgver=4.10.8
pkgrel=3
pkgdesc='Multivariate and Propensity Score Matching with Balance Optimization'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-parallel
  r-rgenoud
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('54412e2ddd1f5eeb189ffc653e4d3ead3e2f9c5c4fe516cfb1966abf69ada49a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
