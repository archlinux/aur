# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pps
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="PPS Sampling"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d639aaaa13550a442ba018927b4f763a')
b2sums=('a4fbfe784bb3824191cc78a878493ca67cb4a7e2ab5254642674b0c4482d24d44b2b71bade4e6aed6ec8592c1d19f254fa989aa2c73bdf07fc8f5c7bd19652bf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
