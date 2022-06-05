# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AlphaBeta
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Computational inference of epimutation rates and spectra from high-throughput DNA methylation data in plants'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-data.table
  r-dplyr
  r-expm
  r-ggplot2
  r-gtools
  r-igraph
  r-optimx
  r-plotly
  r-stringr
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4fc5d4241edbb6ecb13d7ca675ed3cade2a8e54a88e5f70cb54f00555fcc6dc6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
