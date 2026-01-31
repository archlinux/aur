# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=varSelRF
_pkgver=0.7-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Variable Selection using Random Forests"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-randomforest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('af519df1a34f1fe356a4e239f7970973')
b2sums=('0391c6d2f3c0691668e65593536978f46e62419371c34836cfc8531853edc2dedaeb7f4ffbc07fe6074f6aea50639fa06d5635ec56b24957fc09368632cf3796')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
