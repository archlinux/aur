# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppDate
_pkgver=0.0.3
pkgname=r-${_pkgname,,}
pkgver=0.0.3
pkgrel=4
pkgdesc="'date' C++ Header Library for Date and Time Functionality"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9c5ee7cf76d63cd51e8faff831f5f865762868d7d705395960c0f22e9b238bdb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
