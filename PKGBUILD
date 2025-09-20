# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.utils
_pkgver=3.2-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utility Functions for 'spatstat'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-spatstat.model
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('795871eff587b8963c5a187cee1dcfce')
b2sums=('402360232de39ad870b3fa53550773bef466b16cd356cbd18a562df10739649441f494be67b585040a5ce57d4651d8383ca4bc62759bd38cd53aec702d184d59')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
