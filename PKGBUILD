# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=compcodeR
_pkgver=1.36.1
pkgname=r-${_pkgname,,}
pkgver=1.36.1
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
  r-covr
  r-deseq2
  r-dss
  r-ebseq
  r-genefilter
  r-ggtree
  r-nbpseq
  r-noiseq
  r-phangorn
  r-phytools
  r-rmarkdown
  r-rpanel
  r-statmod
  r-sva
  r-tcc
  r-testthat
  r-tidytree
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c5d563af67454afa4ae8c011956d5c34f60b5c99c3c440e8a7bacb12e223fa02')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
