# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ICSNP
_pkgver=1.1-3
pkgname=r-${_pkgname,,}
pkgver=1.1.3
pkgrel=1
pkgdesc='Tools for Multivariate Nonparametrics'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ics
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eec281ef7a4be767d274ed4022e74beb71d159276851a12834bb921b25fcd42c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
