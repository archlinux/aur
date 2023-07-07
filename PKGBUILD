# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=motifbreakR
_pkgver=2.14.2
pkgname=r-${_pkgname,,}
pkgver=2.14.2
pkgrel=1
pkgdesc='A Package For Predicting The Disruptiveness Of Single Nucleotide Polymorphisms On Transcription Factor Binding Sites'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-genomicranges
  r-gviz
  r-iranges
  r-matrixstats
  r-motifdb
  r-motifstack
  r-rtracklayer
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tfmpvalue
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-bsgenome.drerio.ucsc.danrer7
  r-bsgenome.hsapiens.ucsc.hg19
  r-knitr
  r-rmarkdown
  r-snplocs.hsapiens.dbsnp155.grch37
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('82d665cb379cb83844d6c2e028e48ab7a75b46fea3fd47b9ce4f8ce56706db8d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
