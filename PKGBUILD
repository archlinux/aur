# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DiffBind
_pkgver=3.10.1
pkgname=r-${_pkgname,,}
pkgver=3.10.1
pkgrel=1
pkgdesc='Differential Binding Analysis of ChIP-Seq Peak Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-amap
  r-apeglm
  r-ashr
  r-biocparallel
  r-deseq2
  r-dplyr
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-ggrepel
  r-gplots
  r-greylistchip
  r-iranges
  r-limma
  r-locfit
  r-rcolorbrewer
  r-rcpp
  r-rhtslib
  r-rsamtools
  r-s4vectors
  r-summarizedexperiment
  r-systempiper
  make
)
optdepends=(
  r-biocstyle
  r-bsgenome
  r-csaw
  r-edger
  r-genomeinfodb
  r-grid
  r-profileplyr
  r-rgl
  r-rtracklayer
  r-testthat
  r-xlconnect
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6e8ddecfe08bfa9fd16113c325ff98ad3bec317d554b47f07de4bbedb8a0d989')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
