# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plsgenomics
_pkgver=1.5-2.1
pkgname=r-${_pkgname,,}
pkgver=1.5.2.1
pkgrel=1
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
sha256sums=('8a0b49d74e3812ba503efb5caa9c7745502d4a850fba085ea96c573bb0a4c7b2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
