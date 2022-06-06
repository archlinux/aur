# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=locfdr
_pkgver=1.1-8
pkgname=r-${_pkgname,,}
pkgver=1.1.8
pkgrel=4
pkgdesc='Computes Local False Discovery Rates'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('42d6e12593ae6d541e6813a140b92591dabeb1df94432a515507fc2eee9a54b9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
