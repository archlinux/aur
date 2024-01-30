# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distrEx
_pkgver=2.9.2
pkgname=r-${_pkgname,,}
pkgver=2.9.2
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
sha256sums=('d06bcaa1ccb52ef775f7c8b2d6d4676408dbc2813dfc128da34ffa4c7740f3e4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
