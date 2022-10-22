# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rwave
_pkgver=2.6-5
pkgname=r-${_pkgname,,}
pkgver=2.6.5
pkgrel=1
pkgdesc='Time-Frequency Analysis of 1-D Signals'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6c9ef75bb376f2e3f5c5dcd3b3fdca7d86797ce809da34f444632657189be2e4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
