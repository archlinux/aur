# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distrEx
_pkgver=2.9.3
pkgname=r-${_pkgname,,}
pkgver=2.9.3
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
sha256sums=('5a1049777b288a28fe30d6748f59267bef565218ea7be0d798f7771e8023690c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
