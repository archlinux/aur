# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pkgDepTools
_pkgver=1.63.0
pkgname=r-${_pkgname,,}
pkgver=1.63.0
pkgrel=1
pkgdesc='Package Dependency Tools'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-graph
  r-rbgl
)
optdepends=(
  r-biobase
  r-biocmanager
  r-rcurl
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4f51e32fa281b0e23f1ddd87ae89f46c5f0b9bd32446fc05f2771ca06ff80083')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
