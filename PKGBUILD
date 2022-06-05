# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=changepoint
_pkgver=2.2.3
pkgname=r-${_pkgname,,}
pkgver=2.2.3
pkgrel=3
pkgdesc='Methods for Changepoint Detection'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-zoo
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9255f16583a5296a8af02d2a50925a0888b74eae57489d0a28763f3cd3efedc2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
