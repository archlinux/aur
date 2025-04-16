# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iChip
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
pkgrel=1
pkgdesc='Bayesian Modeling of ChIP-chip Data Through Hidden Ising Models'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-limma
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aee1acfe328cebccd741d41b80471f6142d846f467eab25190f6b30baf0d9b45')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
