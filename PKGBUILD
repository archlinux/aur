# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rtracklayer
_pkgver=1.56.1
pkgname=r-${_pkgname,,}
pkgver=1.56.1
pkgrel=1
pkgdesc='R interface to genome annotation files and the UCSC genome browser'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocio
  r-biostrings
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-rcurl
  r-restfulr
  r-rsamtools
  r-s4vectors
  r-xml
  r-xvector
  r-zlibbioc
)
optdepends=(
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-genefilter
  r-genomicfeatures
  r-hgu133plus2.db
  r-humanstemcell
  r-limma
  r-microrna
  r-org.hs.eg.db
  r-runit
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9acadac5fface3639c779d9116cfaf20708fe200163b1c0e92af8e228c4e1e83')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
