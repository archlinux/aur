# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RareVariantVis
_pkgver=2.34.0
pkgname=r-${_pkgname,,}
pkgver=2.34.0
pkgrel=1
pkgdesc='A suite for analysis of rare genomic variants in whole genome sequencing data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-genomicscores
  r-googlevis
  r-gtools
  r-iranges
  r-phastcons100way.ucsc.hg19
  r-s4vectors
  r-summarizedexperiment
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-variantannotation
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f4fed68080609a7f880a6268e3624946061db6986a4eb3d2df9f4d08cdd40425')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
