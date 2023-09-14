# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Matching
_pkgver=4.10-14
pkgname=r-${_pkgname,,}
pkgver=4.10.14
pkgrel=1
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
sha256sums=('bfb4286a5da29dcfcc4ddee6299e2d91c0de177720b060b8946fd16f32f6a6b0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
