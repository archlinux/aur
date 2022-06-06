# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gsmoothr
_pkgver=0.1.7
pkgname=r-${_pkgname,,}
pkgver=0.1.7
pkgrel=4
pkgdesc='Smoothing tools'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b75ffd2a4a0f357762e02e46e355b45cc90ea637830f0a1b01f216bb4541e903')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
