# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=DistributionUtils
_pkgver=0.6-1
pkgname=r-${_pkgname,,}
pkgver=0.6.1
pkgrel=1
pkgdesc='Distribution Utilities'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-generalizedhyperbolic
  r-runit
  r-skewhyperbolic
  r-variancegamma
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('31e79eaa8871b0b9fb8ac63a3fbd852f9ed3047bc584c233ac030b50e1b963d7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
