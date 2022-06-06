# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rebus.numbers
_pkgver=0.0-1
pkgname=r-${_pkgname,,}
pkgver=0.0.1
pkgrel=4
pkgdesc="Numeric Extensions for the 'rebus' Package"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Unlimited')
depends=(
  r
  r-rebus.base
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('43da0fcf06576ef146cf9d363a087ac74fe918f0394d695822920804fed72f37')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
