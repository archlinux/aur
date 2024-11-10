# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CRISPRseek
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='Design of target-specific guide RNAs in CRISPR-Cas9, genome-editing systems'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-data.table
  r-delayedarray
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-hash
  r-iranges
  r-keras
  r-mltools
  r-reticulate
  r-rhdf5
  r-s4vectors
  r-seqinr
  r-xvector
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.mmusculus.ucsc.mm10
  r-lattice
  r-mass
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-runit
  r-tensorflow
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2a55e6a3d73f6960c070560921f6db586bdcfff3e309c84a1432131ef640a9dc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
