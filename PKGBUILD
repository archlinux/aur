# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=binom
_pkgver=1.1-1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Binomial Confidence Intervals for Several Parameterizations"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
optdepends=(
  r-ggplot2
  r-polynom
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6d9cbf4fa0fe82414417f2286d1007b5')
b2sums=('94e84dd51084c3f1703745e085c4efeb992fa795426996a4db3d421e8dfc472f1b917e30a2e70da97ba7cfdbfc94959652273675337b364837008579693796ba')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
