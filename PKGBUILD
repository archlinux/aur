# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SWATH2stats
_pkgver=1.30.1
pkgname=r-${_pkgname,,}
pkgver=1.30.1
pkgrel=1
pkgdesc='Transform and Filter SWATH Data for Statistical Packages'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-data.table
  r-ggplot2
  r-reshape2
)
optdepends=(
  r-alfq
  r-knitr
  r-msstats
  r-peca
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1800c75add448c03110caedf58cfd73eac83fe7983c0f7293eebf9a61ccc6d42')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
