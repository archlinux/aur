# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIPseqR
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
pkgrel=1
pkgdesc='Identifying Protein Binding Sites in High-Throughput Sequencing Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-fbasics
  r-genomicranges
  r-hilbertvis
  r-iranges
  r-s4vectors
  r-shortread
  r-timsac
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fca3ee5ae490f1d009c5e5dcb476fa950b46bacc2ba262d1e89ebdafccc03318')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
