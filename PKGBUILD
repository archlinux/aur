# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=entropy
_pkgver=1.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Estimation of Entropy, Mutual Information and Related Quantities"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a7c849246cf7051373b8ea21950b61f3')
b2sums=('b67fc265a6e5fc04bba9ec5ba0b2065acfa5b63ea70f33148396a3a8b80f3171c81d45dd32456624537464b67d6cbec608e899af9b819fda96c2d3253c84e9f6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
