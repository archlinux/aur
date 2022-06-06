# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SIFT.Hsapiens.dbSNP137
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=1.0.0
pkgrel=3
pkgdesc='PROVEAN/SIFT Predictions for Homo sapiens dbSNP build 137'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-rsqlite
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('48d25a7afcd0107dde7bb57a946ce068b2f3e0efa1a06cbd8f9f2fabf052e290')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
