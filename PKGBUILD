# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TxDb.Hsapiens.UCSC.hg38.knownGene
_pkgver=3.17.0
pkgname=r-${_pkgname,,}
pkgver=3.17.0
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
sha256sums=('cb0c9b63c4068d19d7620bb41b79eed58f75903cf370415df93b366bb927ae91')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
