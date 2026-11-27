# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maPredictDSC
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='Phenotype prediction using microarray data: approach of the best overall team in the IMPROVER Diagnostic Signature Challenge'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-annotationdbi
  r-caret
  r-e1071
  r-gcrma
  r-hgu133plus2.db
  r-limma
  r-lungcanceracvssccgeo
  r-roc
  r-rocr
)
optdepends=(
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('02b9bc29291cf5f8304759fa048b45a1c5cccbbcc6afdffb06f165374ab421b0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
