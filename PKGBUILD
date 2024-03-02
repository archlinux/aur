# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=locfit
_pkgver=1.5-9.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Local Regression, Likelihood and Density Estimation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-gam
  r-interp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('60e6ca00a2b3fbff15f0dbdc0e7f2646')
b2sums=('0b110401d4ceb48c0a289b7bf4c2666e9ed843ad073c811406549521160e6d9ee7bc1f8c2be42634151d72e68fc94926ae785e8cc1a56c781b5bbaffc9930e98')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
