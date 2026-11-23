# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=monaLisa
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Binned Motif Enrichment Analysis and Visualization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-circlize
  r-cli
  r-complexheatmap
  r-genomicranges
  r-ggplot2
  r-glmnet
  r-iranges
  r-rlang
  r-rsqlite
  r-s4vectors
  r-seqinfo
  r-stabs
  r-summarizedexperiment
  r-tfbstools
  r-tidyr
  r-xvector
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-bsgenome.mmusculus.ucsc.mm10
  r-ggrepel
  r-gridextra
  r-jaspar2020
  r-jaspar2024
  r-knitr
  r-rmarkdown
  r-testthat
  r-txdb.mmusculus.ucsc.mm10.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('67e786c5935ab2c49c79351157b8d91a8cbf7c454979d50f6c524d7e38c9b6d6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
