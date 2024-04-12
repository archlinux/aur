# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=readbitmap
_pkgver=0.1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Simple Unified Interface to Read Bitmap Images (BMP,JPEG,PNG,TIFF)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
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
md5sums=('9221be6ab4d68a1fe9292ae60d953d32')
b2sums=('a9f8703bac76fd0b470cebcdc4bde00dc893ce8a6ecbf7dc1309005f984d8d1d731cdaad5f309cf01df647a55f8670410a64afe788f8811ad238548a60949d5a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
