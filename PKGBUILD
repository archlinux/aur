# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PolyPhen.Hsapiens.dbSNP131
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=1.0.2
pkgrel=3
pkgdesc='PolyPhen Predictions for Homo sapiens dbSNP build 131'
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
sha256sums=('ecb8092a63f8a8f0ea4e42ba488c100fd77c8948e0c388f3b03a9048e7f333ce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
