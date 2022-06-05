# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bezier
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=1.1.2
pkgrel=4
pkgdesc='Toolkit for Bezier Curves and Splines'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('262ff2d4f81a8f4b5ba3a5347b906c346f29384bb5b9a0781f2741b4910885ef')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
