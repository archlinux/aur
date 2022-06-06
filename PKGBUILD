# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=keggorthology
_pkgver=2.48.0
pkgname=r-${_pkgname,,}
pkgver=2.48.0
pkgrel=1
pkgdesc='graph support for KO, KEGG Orthology'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-dbi
  r-graph
  r-hgu95av2.db
)
optdepends=(
  r-all
  r-rbgl
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('70e5bc25130618f779b1c60137ce3e241a10e1c890e923f4c9fb8260ae96aca8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
