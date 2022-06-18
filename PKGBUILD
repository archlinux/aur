# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=reportROC
_pkgver=3.6
pkgname=r-${_pkgname,,}
pkgver=3.6
pkgrel=1
pkgdesc='An Easy Way to Report ROC Analysis'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-proc
  r-vcd
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c28d06316fb03bc2097b8a39ab836c7eeb63d6924b5926b2f324d0d366f4cfc1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
