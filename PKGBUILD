# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IntEREst
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Intron-Exon Retention Estimator'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-dbi
  r-deseq2
  r-dexseq
  r-edger
  r-genomicalignments
  r-genomicfeatures
  r-genomicfiles
  r-genomicranges
  r-iranges
  r-rmysql
  r-rsamtools
  r-s4vectors
  r-seqinr
  r-seqlogo
  r-summarizedexperiment
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-clinfun
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4983df5e26609ef94d48d95e9dc9b4b21b7b308de833c0810bc66291708ac7b8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
