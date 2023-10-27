# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=customProDB
_pkgver=1.41.0
pkgname=r-${_pkgname,,}
pkgver=1.41.0
pkgrel=1
pkgdesc='Generate customized protein database from NGS data, with a focus on RNA-Seq data, for proteomics search'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ahocorasicktrie
  r-annotationdbi
  r-biomart
  r-biostrings
  r-dbi
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-plyr
  r-rcurl
  r-rsamtools
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-stringr
  r-variantannotation
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-rmariadb
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ab2aac98334abf50b115eec8d5d214c6d784df38fad511585d23a338966bd4bc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
