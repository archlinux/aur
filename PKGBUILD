# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicFiles
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Distributed computing by file or by range'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-matrixgenerics
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-biostrings
  r-deepsnv
  r-genefilter
  r-homo.sapiens
  r-rnaseqdata.hnrnpc.bam.chr14
  r-runit
  r-snpstats
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a11026ba7461816097b889aa1148f4c5d3227b041e1ed4384817215f5caac44c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
