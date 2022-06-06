# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GO.db
_pkgver=3.15.0
pkgname=r-${_pkgname,,}
pkgver=3.15.0
pkgrel=3
pkgdesc='A set of annotation maps describing the entire Gene Ontology'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
)
optdepends=(
  r-dbi
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bac91d73c57f206fa5bc4a501a2aaf61b365cf411181ce44353370cdbc132d99')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
