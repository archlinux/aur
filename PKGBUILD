# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distrEx
_pkgver=2.9.6
pkgname=r-${_pkgname,,}
pkgver=2.9.6
pkgrel=1
pkgdesc="Extensions of Package 'distr'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-distr
  r-startupmsg
)
optdepends=(
  r-tcltk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e4f0f245ebbe19f5c98cc7a562d1facad455ccd7c4f260281c36cc800b67a061')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
