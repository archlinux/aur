# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DDRTree
_pkgver=0.1.5
pkgname=r-${_pkgname,,}
pkgver=0.1.5
pkgrel=4
pkgdesc='Learning Principal Graphs with DDRTree'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bh
  r-irlba
  r-rcpp
  r-rcppeigen
  gcc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d351ec029461b43c0dcc7c30d9f378753b31ba16c6dbf667869df279b874459b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
