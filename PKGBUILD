# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TitanCNA
_pkgver=1.45.0
pkgname=r-${_pkgname,,}
pkgver=1.45.0
pkgrel=1
pkgdesc='Subclonal copy number and LOH prediction from whole genome sequencing of tumours'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-data.table
  r-dplyr
  r-foreach
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('832283d946048fb25b9eb7ac8c9024c7a113609ba6ff50c7660e90f69287f6a7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
