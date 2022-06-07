# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gradDescent
_pkgver=3.0
pkgname=r-${_pkgname,,}
pkgver=3.0
pkgrel=4
pkgdesc='Gradient Descent for Regression Tasks'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e9acd505aea624c381cfe95839460a2dad4df4f4937007d65c65e2c4a5ddafcb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
