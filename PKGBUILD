# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=entropy
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Estimation of Entropy, Mutual Information and Related Quantities"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL3)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a65db89e6e130f8d420d6d3320121bce')
b2sums=('1112f3a2b3da6d19032c4d34177374e9c6d28189a1e7b5ce5e8a0a1963b57e41832b674e89538f2595d3a33b5324fed1b195a84f620d259cee23de619eedd375')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
