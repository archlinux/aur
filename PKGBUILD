# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=cvar
_pkgver=0.6
pkgname=r-${_pkgname,,}
pkgver=0.6
pkgrel=1
pkgdesc='Compute Expected Shortfall and Value at Risk for Continuous Distributions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gbutils
  r-rdpack
)
optdepends=(
  r-fgarch
  r-performanceanalytics
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9079f57578b0f7e26e788511803e8448ff4f2353c8ff271c5c7b7576198a4330')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
