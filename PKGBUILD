# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TitanCNA
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
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
sha256sums=('7dc833477da7bf9f976149232419cd450d759801777e7b1882329b6afdd4bd92')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
