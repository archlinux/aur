# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ROntoTools
_pkgver=2.40.0
pkgname=r-${_pkgname,,}
pkgver=2.40.0
pkgrel=1
pkgdesc='R Onto-Tools suite'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-graph
  r-kegggraph
  r-keggrest
  r-rgraphviz
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('611ef794ce459277ea7d715ac0f8c4d4f664a11d002ea5689a720688a3d16d63')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
