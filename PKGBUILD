# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ceRNAnetsim
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Regulation Simulator of Interaction between miRNA and Competing RNAs (ceRNA)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dplyr
  r-furrr
  r-future
  r-ggplot2
  r-ggraph
  r-igraph
  r-purrr
  r-rlang
  r-tibble
  r-tidygraph
  r-tidyr
)
optdepends=(
  r-covr
  r-knitr
  r-png
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8ec8e90a6a2647731d047cce7b12423656d11d072d60f4c042e1164ab5b287ae')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
