# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bmp
_pkgver=0.3
pkgname=r-${_pkgname,,}
pkgver=0.3
pkgrel=4
pkgdesc='Read Windows Bitmap (BMP) Images'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-pixmap
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bdf790249b932e80bc3a188a288fef079d218856cf64ffb88428d915423ea649')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
