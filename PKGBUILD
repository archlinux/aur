# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RApiSerialize
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="R API Serialization"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5b422d448340d4924e70d0ab0568cd04')
b2sums=('2ed5fd138f6cab718ac954b51d92daf0f887a45aca14af43586c8f2191470b045ff25f37700bc91c35af289704dac7662b606443144fa32dead2122adca72fc6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
