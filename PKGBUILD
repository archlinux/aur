# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=outliers
_pkgver=0.15
pkgname=r-${_pkgname,,}
pkgver=0.15
pkgrel=3
pkgdesc='Tests for outliers'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cc31d7f2faefd2c3a27f8ce78c7e67d3b321dcd6690292fad2468125e5e635fb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
