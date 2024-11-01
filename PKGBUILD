# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBCB
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MBCB (Model-based Background Correction for Beadarray)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-preprocesscore
  r-tcltk2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('083dda1a76d23a0e162baa2ed3c3da97')
b2sums=('5afa788003d132d81ba177bf5c87c84ebe0943fe5c26a40ce409d2966993b7445850b2ae0ad7e62163c9194047bb920d619aca16e90235487bfe582b405a8ff7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
