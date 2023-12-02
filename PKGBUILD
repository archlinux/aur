# system requirements: GNU make
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=lamW
_pkgver=2.2.3
pkgname=r-${_pkgname,,}
pkgver=2.2.3
pkgrel=1
pkgdesc='Lambert-W Function'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
  r-rcpp
  r-rcppparallel
)
optdepends=(
  r-covr
  r-methods
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a1e232186673d2fc298fc45278a6ff169db428fe8a63551c9297124a05ee034b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
