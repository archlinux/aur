# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ssize
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=1.80.0
pkgrel=1
pkgdesc='Estimate Microarray Sample Size'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-gdata
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3a0c110800b7048a9c38d6d72d256767ecfef2f136b4d487186a76c760ccb7a3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
