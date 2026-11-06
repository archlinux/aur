# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BBmisc
_pkgver=1.13.2
pkgname=r-${_pkgname,,}
pkgver=1.13.2
pkgrel=1
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
sha256sums=('412ea9cb2b1bfa124c35e3e291019f6e573dbdfb76deff8e8c86ff8fdca6f941')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
