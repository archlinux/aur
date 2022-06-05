# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BBmisc
_pkgver=1.12
pkgname=r-${_pkgname,,}
pkgver=1.12
pkgrel=3
pkgdesc='Miscellaneous Helper Functions for B. Bischl'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
  r-checkmate
  r-data.table
)
optdepends=(
  r-codetools
  r-microbenchmark
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('900a633f69b7d9b13d58709eeae2fca2c1bc510765d778623a2af32cc870053e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
