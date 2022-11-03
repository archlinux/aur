# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=compcodeR
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='RNAseq data simulation, differential expression analysis and performance comparison of differential expression methods'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-catools
  r-edger
  r-ggplot2
  r-gplots
  r-gtools
  r-knitr
  r-limma
  r-markdown
  r-modeest
  r-rocr
  r-sm
  r-stringr
  r-vioplot
  tk
  r-matrixstats
  r-ape
  r-phylolm
)
optdepends=(
  r-bayseq
  r-biocstyle
  r-deseq2
  r-dss
  r-ebseq
  r-genefilter
  r-nbpseq
  r-noiseq
  r-rmarkdown
  r-rpanel
  r-tcc
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f9575fddbd5a17750695c1df4f0bb394792a7755a52da5f334a0b967e2db5bb1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
