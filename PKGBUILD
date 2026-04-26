# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kSamples
_pkgver=1.2-12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="K-Sample Rank Tests and their Combinations"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-suppdists
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c1c26a5243114c3b979344f5ab7f2242')
b2sums=('3e3a1b4f53d909e25b01abf5ecd5a1f5d17a2d301895d71dcc7a73ecdb0d085befb8e17c8ed7566d8d9802a63cea0a62379ab9146f8b1d88e3a8b06f3135c384')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
