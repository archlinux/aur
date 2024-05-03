# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cosmosR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='COSMOS (Causal Oriented Search of Multi-Omic Space)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-carnival
  r-decoupler
  r-dorothea
  r-dplyr
  r-gseabase
  r-igraph
  r-progress
  r-purrr
  r-rlang
  r-stringr
  r-visnetwork
)
optdepends=(
  r-ggplot2
  r-knitr
  r-piano
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5ce329f5f57fd5f210213812a8ee10751e6062219f34c59a48e816a77d33fe66')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
