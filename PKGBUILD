# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MEDIPS
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=1.60.0
pkgrel=1
pkgdesc='DNA IP-seq data analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-biostrings
  r-bsgenome
  r-dnacopy
  r-edger
  r-genomicranges
  r-gtools
  r-iranges
  r-preprocesscore
  r-rsamtools
  r-rtracklayer
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-medipsdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bf3aec6d2ad4079c387e146fe625507cfbc0e12de09b77f03f8348d6b2b67ce7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
