# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maigesPack
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
pkgrel=1
pkgdesc='Functions to handle cDNA microarray data, including several methods of data analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-convert
  r-graph
  r-limma
  r-marray
)
optdepends=(
  r-amap
  r-annotate
  r-class
  r-e1071
  r-mass
  r-multtest
  r-olin
  r-r2html
  r-rgl
  r-som
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1d33b89cc5d5b894d44005c5926c9dbfab479cb12bf361bed8930bf8d56bd180')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
