# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plsgenomics
_pkgver=1.5-2
pkgname=r-${_pkgname,,}
pkgver=1.5.2
pkgrel=3
pkgdesc='PLS Analyses for Genomics'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fields
  r-plyr
  r-reshape2
  r-rhpcblasctl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e4c6f57590464ad64b8d9c7322a24fc41bf1befab76b28ea4a8949b32d286bdf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
