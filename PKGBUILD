# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TxDb.Hsapiens.UCSC.hg19.knownGene
_pkgver=3.22.1
pkgname=r-${_pkgname,,}
pkgver=3.22.1
pkgrel=1
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
sha256sums=('aeb62fd82654785847c80646a20d2b2196715b9878dd80171521b1f15bdcbfb1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
