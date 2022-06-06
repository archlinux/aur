# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=norm
_pkgver=1.0-10.0
pkgname=r-${_pkgname,,}
pkgver=1.0.10.0
pkgrel=3
pkgdesc='Analysis of multivariate normal datasets with missing values'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('custom')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4384791af74c1008238f036abe0dda4b4048b9700cc4acd7b45025598fd20cc7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
#  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
