# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=InPAS
_pkgver=2.14.1
pkgname=r-${_pkgname,,}
pkgver=2.14.1
pkgrel=1
pkgdesc='A Bioconductor package for identifying novel Alternative PolyAdenylation Sites (PAS) from RNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-batchtools
  r-biobase
  r-biostrings
  r-bsgenome
  r-cleanupdtseq
  r-depmixs4
  r-dplyr
  r-flock
  r-future
  r-future.apply
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-limma
  r-magrittr
  r-parallelly
  r-plyranges
  r-preprocesscore
  r-readr
  r-reshape2
  r-rsqlite
  r-s4vectors
)
optdepends=(
  r-biocgenerics
  r-biocmanager
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.mmusculus.ucsc.mm10
  r-ensdb.hsapiens.v86
  r-ensdb.mmusculus.v79
  r-grdevices
  r-knitr
  r-markdown
  r-rmarkdown
  r-rtracklayer
  r-runit
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3d26355bb120ec18605fda03f581aa8849c28bd7ea9a9a5279d320bab03a1c77')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
