# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mixsmsn
_pkgver=1.1-10
pkgname=r-${_pkgname,,}
pkgver=1.1.10
pkgrel=4
pkgdesc='Fitting Finite Mixture of Scale Mixture of Skew-Normal Distributions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7dec9a14f17786c32ab6fd290e9051f66da8c15f84af4310ffc2285a4c5e61f0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
