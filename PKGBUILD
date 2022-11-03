# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBcoexpress
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='EBcoexpress for Differential Co-Expression Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ebarrays
  r-mclust
  r-minqa
)
optdepends=(
  r-colorspace
  r-graph
  r-igraph
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d68fa67c3d594dcdf5d456ecf5f312ab94e65d047409226d0482e092a51e5a71')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
