# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TurboNorm
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=1
pkgdesc='A fast scatterplot smoother suitable for microarray normalization'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-affy
  r-convert
  r-limma
  r-marray
)
optdepends=(
  r-affydata
  r-biocstyle
  r-hgu95av2cdf
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('99194af8be014f4add8a030818aa2ddedf05a519c2018774847a8510064e0f19')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
