# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CircStats
_pkgver=0.2-6
pkgname=r-${_pkgname,,}
pkgver=0.2.6
pkgrel=4
pkgdesc='Circular Statistics, from "Topics in Circular Statistics" (2001)'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8efed93b75b314577341effea214e3dd6e0a515cfe1212eb051047a1f3276f1d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
