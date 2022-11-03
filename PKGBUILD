# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GO.db
_pkgver=3.16.0
pkgname=r-${_pkgname,,}
pkgver=3.16.0
pkgrel=1
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
sha256sums=('4652812d8ba380aeeb9b136efbc9365156397eec99c5ca36cfb8294139493b8e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
