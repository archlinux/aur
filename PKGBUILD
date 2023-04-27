# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReactomeGraph4R
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Interface for the Reactome Graph Database'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Apache')
depends=(
  r
  r-data.table
  r-doparallel
  r-foreach
  r-getpass
  r-jsonlite
  r-magrittr
  r-neo4r
  r-purrr
  r-reactomecontentservice4r
  r-rlang
)
optdepends=(
  r-knitr
  r-networkd3
  r-rmarkdown
  r-stringr
  r-testthat
  r-visnetwork
  r-wesanderson
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('02a59ef4693c0cd4148e0a49aa343c6f4bdd26d513af42948baab65b6af8c62d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
