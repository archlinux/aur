# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqCNA.annot
_pkgver=1.35.0
pkgname=r-${_pkgname,,}
pkgver=1.35.0
pkgrel=1
pkgdesc='Annotation for the copy number analysis of deep sequencing cancer data with seqCNA'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cb1c9c80e1e02018a4584f6d2ff297a26b24e1ecfb085d7817e47b55e577b9f1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
