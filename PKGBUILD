# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BAC
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=4
pkgdesc='Bayesian Analysis of Chip-chip experiment'
arch=('x86_64')
url="https://bioconductor.org/packages/3.16/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e67ed9760f5cd71a1e884eb0b0e93f63721e0f2c8733d969e5a4079bb485b301')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
