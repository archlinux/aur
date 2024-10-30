# system requirements: libxml2, libSBML (>= 5.5)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NetPathMiner
_pkgver=1.40.2
pkgname=r-${_pkgname,,}
pkgver=1.40.2
pkgrel=1
pkgdesc='NetPathMiner for Biological Network Construction, Path Mining and Visualization'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
)
optdepends=(
  r-biocstyle
  r-graph
  r-knitr
  r-rbiopaxparser
  r-rcurl
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6f956810799494ffca03e128e451a3064c1350a4d08632675c3ea44334152e6b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
