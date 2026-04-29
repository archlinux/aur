# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBcoexpress
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=1.56.0
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
sha256sums=('48fa1f12c5828eb849f42f49fee8f7eea406a17f7a9166d61bae5d04e7e0dfb0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
