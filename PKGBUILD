# system requirements: cairo (>= 1.2 http://www.cairographics.org/)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Cairo
_pkgver=1.5-15
pkgname=r-${_pkgname,,}
pkgver=1.5.15
pkgrel=3
pkgdesc='R Graphics Device using Cairo Graphics Library for Creating High-Quality Bitmap (PNG, JPEG, TIFF), Vector (PDF, SVG, PostScript) and Display (X11 and Win32) Output'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  cairo
)
optdepends=(
  r-fastrweb
  r-png
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bb3ab1ff6431c15eb01a66ddf90695cd9a2af3d5a384753f5180cd0401d2e89d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
