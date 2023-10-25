# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HEM
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=1.74.0
pkgrel=1
pkgdesc='Heterogeneous error model for identification of differentially expressed genes under multiple conditions'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('58cba3031e2454c122bacbcf3e20fd215bb2650bea46c3eb0941900fe31131fe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
