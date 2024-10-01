# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=StAMPP
_pkgver=1.6.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical Analysis of Mixed Ploidy Populations"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-adegenet
  r-doparallel
  r-foreach
  r-pegas
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('55572ba048c52d49532485790d4644a3')
b2sums=('019a1b1b8d68c17a281fc4b2970efae0c5cf33a5950d9de8c511d501a86bf67c7bd82cc54942b9684a586f604784accb9fad80eb6b4c515fe74a23722bbf3bbe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
