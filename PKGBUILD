# system requirements: libjpeg, libpng
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=readbitmap
_pkgver=0.1.5
pkgname=r-${_pkgname,,}
pkgver=0.1.5
pkgrel=4
pkgdesc='Simple Unified Interface to Read Bitmap Images (BMP,JPEG,PNG,TIFF)'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bmp
  r-jpeg
  r-png
  r-tiff
)
optdepends=(
  r-pixmap
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('737d7d585eb33de2c200da64d16781e3c9522400fe2af352e1460c6a402a0291')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
