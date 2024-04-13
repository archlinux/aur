# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=dunn.test
_pkgver=1.3.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Dunn's Test of Multiple Comparisons Using Rank Sums"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8ed81cd5f138a4dac25681841cb1ca81')
b2sums=('36a78324aee1f7741bcb6ce5a757c486c1aeae66ebfb9e64e36abf8d0d9d3accc3946ba8a694142b8d3592630c851ac260b978a2ff674dbb4fe114e77c711dc1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
