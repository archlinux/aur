# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicFeatures
_pkgver=1.50.3
pkgname=r-${_pkgname,,}
pkgver=1.50.3
pkgrel=1
pkgdesc='Conveniently import and query gene models'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocio
  r-biomart
  r-biostrings
  r-dbi
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-rcurl
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-xvector
)
optdepends=(
  r-annotationfilter
  r-biocstyle
  r-bsgenome
  r-bsgenome.celegans.ucsc.ce11
  r-bsgenome.dmelanogaster.ucsc.dm3
  r-bsgenome.hsapiens.ucsc.hg19
  r-ensembldb
  r-fdb.ucsc.trnas
  r-genomicalignments
  r-knitr
  r-markdown
  r-mirbase.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pasillabamsubset
  r-rmariadb
  r-rsamtools
  r-runit
  r-snplocs.hsapiens.dbsnp144.grch38
  r-txdb.celegans.ucsc.ce11.ensgene
  r-txdb.dmelanogaster.ucsc.dm3.ensgene
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg19.lincrnastranscripts
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9f3b5dfa7f36c9c60e115a4f15ef8e4b6b85c879e211348b645a79f52c3df692')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
