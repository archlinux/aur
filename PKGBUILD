# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=decompTumor2Sig
_pkgver=2.18.0
pkgname=r-${_pkgname,,}
pkgver=2.18.0
pkgrel=1
pkgdesc='Decomposition of individual tumors into mutational signatures by signature refitting'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome.hsapiens.ucsc.hg19
  r-data.table
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggseqlogo
  r-gridextra
  r-plyr
  r-quadprog
  r-readxl
  r-s4vectors
  r-summarizedexperiment
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b2e9afccdb784efe1757711f5e49ed62963a3368b87d250e4c2bdf2fd0cb7c8f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
