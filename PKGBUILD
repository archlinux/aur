# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gwascat
_pkgver=2.36.0
pkgname=r-${_pkgname,,}
pkgver=2.36.0
pkgrel=1
pkgdesc='representing and modeling data in the EMBL-EBI GWAS catalog'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-biocfilecache
  r-biostrings
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-readr
  r-s4vectors
  r-snpstats
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-delayedarray
  r-do.db
  r-dplyr
  r-dt
  r-ggbio
  r-graph
  r-gviz
  r-knitr
  r-org.hs.eg.db
  r-rbgl
  r-rmarkdown
  r-rsamtools
  r-rtracklayer
  r-snplocs.hsapiens.dbsnp144.grch37
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2c83a1062c8605ffac277590145db0c461707b57f647d4121c9a6b4573036721')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
