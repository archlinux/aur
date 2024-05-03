# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VariantFiltering
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Filtering of coding and non-coding genetic variants'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-dt
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-genomicscores
  r-graph
  r-gviz
  r-iranges
  r-rbgl
  r-rsamtools
  r-s4vectors
  r-shiny
  r-shinyjs
  r-shinythemes
  r-shinytree
  r-summarizedexperiment
  r-variantannotation
  r-xvector
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.1000genomes.hs37d5
  r-mafdb.1kgenomes.phase1.hs37d5
  r-org.hs.eg.db
  r-phastcons100way.ucsc.hg19
  r-polyphen.hsapiens.dbsnp131
  r-runit
  r-sift.hsapiens.dbsnp137
  r-snplocs.hsapiens.dbsnp144.grch37
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('edc107568740413ef2d23aaf216ac8575335111ea953f5c8804887e3dfa77d92')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
