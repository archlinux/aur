# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=karyoploteR
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Plot customizable linear genomes displaying arbitrary data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-bamsignals
  r-bezier
  r-biovizbase
  r-digest
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-memoise
  r-regioner
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg19.masked
  r-knitr
  r-magrittr
  r-markdown
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pasillabamsubset
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1d192cf0b0564d8b1b89710e0e1e6f387824434d45994b94e6a87e45a5a80cdb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
