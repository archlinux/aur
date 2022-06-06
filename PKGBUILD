# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distances
_pkgver=0.1.8
pkgname=r-${_pkgname,,}
pkgver=0.1.8
pkgrel=4
pkgdesc='Tools for Distance Metrics'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('be4bda79078774adc3cf2a69e3aaad2644a21daba81bb17f04c8f48f839ebc56')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
