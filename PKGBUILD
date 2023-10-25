# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffGeneAnalysis
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=1.84.0
pkgrel=1
pkgdesc='Performs differential gene expression Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-minpack.lm
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6021d33ab50d0682484571238dc5c1672462deef44e6259102bcf68b54d14d9d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
