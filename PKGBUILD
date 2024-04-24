# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pdist
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Partitioned Distance Function"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f6bd156a9a05bc3b615ce8fc27a78e4d')
b2sums=('59bec22272c188c5f7cd6e3b078921a46ad847ae4dc4dd660ba66577ae12040f2bac1047dddcf7c8720931ef6a57a2866623423629a1858903a1eae38b1430ff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
