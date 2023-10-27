# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R453Plus1Toolbox
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc="A package for importing and analyzing data from Roche's Genome Sequencer System"
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-biomart
  r-biostrings
  r-bsgenome
  r-genomicranges
  r-iranges
  r-r2html
  r-rsamtools
  r-s4vectors
  r-shortread
  r-summarizedexperiment
  r-teachingdemos
  r-variantannotation
  r-xtable
  r-xvector
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.scerevisiae.ucsc.saccer2
  r-rtracklayer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ed811c246dcf5cb0522a677c2a0d88e3e45b91728a5133cdc8703f608708e258')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
