# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=regioneR
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Association analysis of genomic regions based on permutation tests'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-memoise
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19.masked
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e16bbe258a05850edd8b270181ef1415445e0ca5cd1d446882ac9a96d4c3343f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
