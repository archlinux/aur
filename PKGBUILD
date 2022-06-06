# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tspair
_pkgver=1.53.0
pkgname=r-${_pkgname,,}
pkgver=1.53.0
pkgrel=1
pkgdesc='Top Scoring Pairs for Microarray Classification'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b3a00f4f49371e46b138a728d5430f4fb0084dd7816e3418b4d3d61146cdbd13')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
