# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spsUtil
_pkgver=0.2.2.1
pkgname=r-${_pkgname,,}
pkgver=0.2.2.1
pkgrel=1
pkgdesc="'systemPipeShiny' Utility Functions"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-crayon
  r-glue
  r-httr
  r-magrittr
  r-r6
  r-stringr
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1247f628571c046805c9b0e4acf4bd5c25fa8312974085483c1422a5e46a7b8a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
