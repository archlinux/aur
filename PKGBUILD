# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=supraHex
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='supraHex: a supra-hexagonal map for analysing tabular omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-dplyr
  r-hexbin
  r-igraph
  r-magrittr
  r-purrr
  r-readr
  r-stringr
  r-tibble
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f4dc1058499ee8c79d4d8b5c703e51ff2a739d4c82adda56df7db1f217df0e83')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
