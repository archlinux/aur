# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AllelicImbalance
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='Investigates Allele Specific Expression'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-gridextra
  r-gviz
  r-iranges
  r-latticeextra
  r-rsamtools
  r-s4vectors
  r-seqinr
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-snplocs.hsapiens.dbsnp144.grch37
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c5e1bb6c97a3582ed8f5adca2371b5327f383601e8c814502da0f512f0ca32bf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
