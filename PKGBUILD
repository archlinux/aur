# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NCIgraph
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='Pathways from the NCI Pathways Database'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-graph
  r-kegggraph
  r-r.methodss3
  r-rbgl
  r-rcy3
)
optdepends=(
  r-degraph
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2cf666db4d6e6ef0dc09bb3770a07751e5a554eadaaad8e72ca3abec05815997')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
