# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=systemfit
_pkgver=1.1-30
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Estimating Systems of Simultaneous Equations"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-car
  r-lmtest
  r-sandwich
)
optdepends=(
  r-knitr
  r-plm
  r-sem
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ce0cf8a69c9c3c0f916c2d32770803c1')
b2sums=('93fbb7a9f5f774c39498267b1bd9effff9b1006c4bb9fd728a34db0769016b9681f8bb9c511aecee9867843bbeea0c00c6cbc4245c6db2b7633039e0b6ed9988')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
