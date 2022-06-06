# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=survivalsvm
_pkgver=0.0.5
pkgname=r-${_pkgname,,}
pkgver=0.0.5
pkgrel=3
pkgdesc='Survival Support Vector Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-hmisc
  r-kernlab
  r-pracma
  r-quadprog
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ea4d39ebecb38e4e4e89891b2d5c2ba222344879bcdd8dac9be0078c73cb90ac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
