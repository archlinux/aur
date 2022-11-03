# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNORfeeder
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
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
  r-catnet
  r-igraph
  r-meigor
  r-minet
  r-rgraphviz
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('10f0c29938071d8859134354a846f8e9d41826e6a9309626241389a549ad1c79')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
