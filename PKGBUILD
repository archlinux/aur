# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=curry
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgver=0.1.1
pkgrel=4
pkgdesc='Partial Function Application with %<%, %-<%, and %><%'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4930c6d5cdb6fa319b888d2220b9ded2c7bf786d8a700ad102558065d78649df')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
