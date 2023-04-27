# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HTSeqGenie
_pkgver=4.30.0
pkgname=r-${_pkgname,,}
pkgver=4.30.0
pkgrel=1
pkgdesc='A NGS analysis pipeline.'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-cairo
  r-chipseq
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-gmapr
  r-hwriter
  r-iranges
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-shortread
  r-summarizedexperiment
  r-variantannotation
  r-varianttools
)
optdepends=(
  r-lungcancerlines
  r-org.hs.eg.db
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4e6142a35ffde25d4813aca8249864049e741e4ad96a2804c8265c7b398c620b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
