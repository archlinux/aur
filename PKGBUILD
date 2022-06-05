# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=binr
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=1.1
pkgrel=4
pkgdesc='Cut Numeric Values into Evenly Distributed Groups'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('191cf56bf7d8fe8a318a0894f5b9e412266f8088abb004e785b9ade37f48f34d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
