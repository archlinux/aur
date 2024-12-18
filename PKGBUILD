# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biovizBase
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=1.54.0
pkgrel=1
pkgdesc='Basic graphic utilities for visualization of genomic data.'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationfilter
  r-biocgenerics
  r-biostrings
  r-dichromat
  r-ensembldb
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-hmisc
  r-iranges
  r-rcolorbrewer
  r-rlang
  r-rsamtools
  r-s4vectors
  r-scales
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-ensdb.hsapiens.v75
  r-rtracklayer
  r-runit
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e6fb8ba6cfab2e5c75036e2ccbf17f1a1fdb8949c183e4aaf221a1a4e680903c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
