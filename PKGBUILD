# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pd.mapping50k.xba240
_pkgver=3.12.0
pkgname=r-${_pkgname,,}
pkgver=3.12.0
pkgrel=3
pkgdesc='Platform Design Info for Affymetrix Mapping50K_Xba240'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-dbi
  r-iranges
  r-oligo
  r-oligoclasses
  r-rsqlite
  r-s4vectors
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('08772e998df196f6d41d9b390ace97881564d5fa4ec8d5b8921e725f201d2ea8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
