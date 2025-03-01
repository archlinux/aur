# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rapportools
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=1.2
pkgrel=1
pkgdesc='Miscellaneous (stats) helper functions with sane defaults for reporting'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('AGPL')
depends=(
  r
  r-pander
  r-plyr
  r-reshape2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('520b39c51bd90b1136441f97551f298357bff21cbee4ebce85039543e93cb27b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
