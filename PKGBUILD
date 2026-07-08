# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=binom
_pkgver=1.1-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Binomial Confidence Intervals for Several Parameterizations"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-ggplot2
  r-polynom
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('433217697726d9c19515870cf4a14d31')
b2sums=('93962635c723f16c99939707c0114f68967623e64b70d8202c0b2c10576e37be4f5b39a0242aae1820bac325f59ba4093b6201a2e723c5e92ddb78693a5ccf1e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
