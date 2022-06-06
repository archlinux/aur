# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TxDb.Dmelanogaster.UCSC.dm3.ensGene
_pkgver=3.2.2
pkgname=r-${_pkgname,,}
pkgver=3.2.2
pkgrel=4
pkgdesc='Annotation package for TxDb object(s)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-genomicfeatures
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('879d366e7c6ca9734a059c060e0b36019e11f32c42e83a90fa31d69687e8678c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
