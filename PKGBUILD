# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vbmp
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
pkgrel=1
pkgdesc='Variational Bayesian Multinomial Probit Regression'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-biobase
  r-statmod
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('16647f0c60bae0870e5d87d5a0205e982464c216b03f30eac610d626aadabd0b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
