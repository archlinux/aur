# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=netbiov
_pkgver=1.31.0
pkgname=r-${_pkgname,,}
pkgver=1.31.0
pkgrel=1
pkgdesc='A package for visualizing complex biological network'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-matrix
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c9b992e1db8728f3bd8b6e6c704219ef337a8780b830868bd206c3d3105eb751')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
