# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HiddenMarkov
_pkgver=1.8-14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Hidden Markov Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6fd5c035c91b8f4cb804c335201876d7')
b2sums=('57963287af04401b2b6bc57b9b5f4565a1141ff905407db2d2bb9233c6bf9e556a0aa38b0b75b797d472f16ec94bae9f06021f2d4df7077d921347786f74507c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
