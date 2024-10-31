# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TurboNorm
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=1.54.0
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
sha256sums=('c537e21c7e1e538f7bf11a5a3c264ac2f8507699673ee017c29a2fcb792e3a83')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
