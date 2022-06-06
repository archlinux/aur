# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DO.db
_pkgver=2.9
pkgname=r-${_pkgname,,}
pkgver=2.9
pkgrel=4
pkgdesc='A set of annotation maps describing the entire Disease Ontology'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('762bcb9b5188274fd81d82f785cf2846a5acc61fad55e2ff8ec1502282c27881')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
