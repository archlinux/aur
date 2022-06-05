# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=benchdamic
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc='Benchmark of differential abundance methods on microbiome data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-aldex2
  r-biocparallel
  r-corncob
  r-cowplot
  r-deseq2
  r-edger
  r-ffpe
  r-ggdendro
  r-ggplot2
  r-limma
  r-mast
  r-metagenomeseq
  r-mglm
  r-phyloseq
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-seurat
  r-summarizedexperiment
  r-zinbwave
)
optdepends=(
  r-biocstyle
  r-curatedmetagenomicdata
  r-hmp16sdata
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('165b017b9f33d27bf7b4d627e4f1dba696a2bf4f1c61e2cf8aacd9ce41b50674')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
