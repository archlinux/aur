# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dtw
_pkgver=1.23-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Dynamic Time Warping Algorithms"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-proxy
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4a0f529591bd3b6ed893279e0305e7e8')
b2sums=('1938aab6896174b81223f43d25aa0776b8256792674eff52dbb71fb76c9c3f71895238f09ac046fe82118b4ebf2477cabc1e051bb3882eada683fae3361d86b7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
