# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicFiles
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
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
sha256sums=('b8ecdacfff7c0cfbe1d0c1fda47c776c41e2ad37f966b953d18c0616cd53907a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
