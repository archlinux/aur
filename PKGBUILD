# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=InPAS
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=2.4.0
pkgrel=1
pkgdesc='A Bioconductor package for identifying novel Alternative PolyAdenylation Sites (PAS) from RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-cleanupdtseq
  r-dbi
  r-depmixs4
  r-dplyr
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-limma
  r-magrittr
  r-plyranges
  r-preprocesscore
  r-purrr
  r-readr
  r-reshape2
  r-rsqlite
  r-s4vectors
  r-batchtools
  r-flock
  r-future
  r-future.apply
  r-parallelly
)
optdepends=(
  r-biocgenerics
  r-biocmanager
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.mmusculus.ucsc.mm10
  r-ensdb.hsapiens.v86
  r-ensdb.mmusculus.v79
  r-knitr
  r-markdown
  r-rmarkdown
  r-rtracklayer
  r-runit
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('37627a4179d745c35b014e4e7366cd1f41102e617f7544e8b9f7d9091c94cd9e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
