# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicFiles
_pkgver=1.44.1
pkgname=r-${_pkgname,,}
pkgver=1.44.1
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
  r-knitr
  r-rnaseqdata.hnrnpc.bam.chr14
  r-runit
  r-snpstats
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d60f84b1e6abf7e644c640e72515773bec8909e0a44979d91e3c96f0b49c28cc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
