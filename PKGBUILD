# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TxDb.Hsapiens.UCSC.hg18.knownGene
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
sha256sums=('bc9ca40b4eab87f5ca64a4b876d42502b9b8e9f5983d745bfe0ee349d97b69fa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
