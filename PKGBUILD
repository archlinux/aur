# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ABAEnrichment
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=3
pkgdesc='Gene expression enrichment in human brain regions'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-abadata
  r-data.table
  r-gofuncr
  r-gplots
  r-gtools
  r-rcpp
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8400e2c51de1e2199b830d02519ce98ef36c3dd74b90de9b1028d39fc571e3ea')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
