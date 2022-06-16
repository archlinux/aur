# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dgof
_pkgver=1.4
pkgname=r-${_pkgname,,}
pkgver=1.4
pkgrel=1
pkgdesc='Discrete Goodness-of-Fit Tests'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d56165658bb97dce2be7a309baada24fce3facef67853b17b663ab23fc7a6f5d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
