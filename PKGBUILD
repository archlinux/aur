# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=idr
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=1.3
pkgrel=1
pkgdesc='Irreproducible discovery rate'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6b3910dc48495439cd01828f8999823864a6712f73560ee3e6c903065c67d1e4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
