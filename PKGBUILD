# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=zCompositions
_pkgver=1.5
pkgname=r-${_pkgname,,}
pkgver=1.5
pkgrel=1
pkgdesc='Treatment of Zeros, Left-Censored and Missing Values in Compositional Data Sets'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-nada
  r-truncnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('17018a9a334f4d57e2c3214a36d932824f7d11314014f6ad9fb8443de0e0cfc1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
