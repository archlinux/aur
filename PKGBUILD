# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=cvar
_pkgver=0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
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
sha256sums=('7e721a68a321acbc74149d6ae9c6e3b0c1f896df9fa7786b8b40264e1db2db18')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
