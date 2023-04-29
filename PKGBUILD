# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=norm
_pkgver=1.0-11.0
pkgname=r-${_pkgname,,}
pkgver=1.0.11.0
pkgrel=1
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
sha256sums=('cd8a4e81782ec459cb4a9665c407147b2cd3a0d4a7562f60689415864269402e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
#  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
