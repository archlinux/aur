# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNORfeeder
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Integration of CellNOptR to add missing links'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cellnoptr
  r-graph
)
optdepends=(
  r-biocgenerics
  r-igraph
  r-meigor
  r-minet
  r-rgraphviz
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('61b9e0013947a0e9f87604abf030fc10dc3c964e9aac7e751bb1b6e97de7e161')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
