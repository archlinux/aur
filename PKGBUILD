# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ConsRank
_pkgver=2.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Compute the Median Ranking(s) According to the Kemeny's Axiomatic Approach"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-gtools
  r-proxy
  r-rgl
  r-rlist
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b24aef924d7c79a5006eff16c1dc968b')
sha256sums=('7ef9fd405d2f01a9b31fccbbfe0bdb1fd3dcbec6654f553db3ef3a21ffc92d6c')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
