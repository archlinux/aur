# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqPattern
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Visualising oligonucleotide patterns and motif occurrences across a set of sorted sequences'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biostrings
  r-genomicranges
  r-iranges
  r-plotrix
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-bsgenome.drerio.ucsc.danrer7
  r-cager
  r-parallel
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('347ab12dba9e45a062ab33e9ca21101518170cdb477963f77226f6768cd6700c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
