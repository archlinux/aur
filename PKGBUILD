# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rarity
_pkgver=1.3-8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Calculation of Rarity Indices for Species and Assemblages of Species"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cae640452055a28493520c7890abe190')
b2sums=('66477dac9f6b0c6c21ac626152dd4a7a5265d9b07aaabbf15933bbd3846b953841cf67a233f5b5e806cd42e5acaf384a615c2f3668dd18cd871c559fcb1b2467')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
