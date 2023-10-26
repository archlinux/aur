# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nnNorm
_pkgver=2.66.0
pkgname=r-${_pkgname,,}
pkgver=2.66.0
pkgrel=1
pkgdesc='Spatial and intensity based normalization of cDNA microarray data based on robust neural nets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-marray
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d6ca0b553097dd9e40a6e8f1b431f8e6ac30b71289c7c0b5a4cddc5a1d43c471')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
