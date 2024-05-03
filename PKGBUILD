# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bambu
_pkgver=3.6.0
pkgname=r-${_pkgname,,}
pkgver=3.6.0
pkgrel=1
pkgdesc='Reference-guided isoform reconstruction and quantification for long read RNA-Seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rcpp
  r-rcpparmadillo
  r-rsamtools
  r-s4vectors
  r-summarizedexperiment
  r-tidyr
  r-xgboost
  r-bsgenome
)
optdepends=(
  r-annotationdbi
  r-apeglm
  r-biocfilecache
  r-biostrings
  r-bsgenome.hsapiens.ncbi.grch38
  r-circlize
  r-complexheatmap
  r-deseq2
  r-dexseq
  r-experimenthub
  r-ggbio
  r-ggplot2
  r-gridextra
  r-knitr
  r-nanoporernaseq
  r-parallel
  r-purrr
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bc7043c8950f12daf095f340b83c50b55dc3163c26a0e57e07f6b26dc951c6de')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
