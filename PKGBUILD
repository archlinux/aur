# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=topdownr
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Investigation of Fragmentation Conditions in Top-Down Proteomics'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biostrings
  r-ggplot2
  r-msnbase
  r-mzr
  r-protgenerics
  r-psmatch
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-ranger
  r-rmarkdown
  r-testthat
  r-topdownrdata
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b6c3534d0179ab036ac6905b1547843786fefb5889143bf087d28135943abe2e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
