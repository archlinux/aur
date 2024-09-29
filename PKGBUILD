# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=robslopes
_pkgver=1.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Algorithms for Robust Slopes"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('31b7009d1f6a74e59ede22c4e2192cad')
b2sums=('acc401c1e5aa5d81740662545e0f4ca3a0dca180e6abba2a48ef637d8da3458d861730e4f94761b431e926f9c5b6ce2e92873edfed20dadf5c6f19fbadf54367')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
