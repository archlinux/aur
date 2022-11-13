# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.linnet
_pkgver=3.0-2
pkgname=r-${_pkgname,,}
pkgver=3.0.2
pkgrel=1
pkgdesc="Linear Networks Functionality of the 'spatstat' Family"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-spatstat.core
  r-spatstat.data
  r-spatstat.explore
  r-spatstat.geom
  r-spatstat.model
  r-spatstat.sparse
  r-spatstat.utils
)
optdepends=(
  r-goftest
  r-locfit
  r-spatstat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('07b3be1c2f074071b8833df2b33daef0f1191fee88eb3054949a0b583e3360ac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
