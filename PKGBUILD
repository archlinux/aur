# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biganalytics
_pkgver=1.1.21
pkgname=r-${_pkgname,,}
pkgver=1.1.21
pkgrel=4
pkgdesc="Utilities for 'big.matrix' Objects from Package 'bigmemory'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-bh
  r-biglm
  r-bigmemory
  r-foreach
  r-rcpp
)
optdepends=(
  r-methods
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('debd18d8ed2e1a49fe25c69f8a636b955b1cabedd36ec69c0bff53b64d8eb9a5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
