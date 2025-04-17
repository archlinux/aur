# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ConsRank
_pkgver=2.1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compute the Median Ranking(s) According to the Kemeny's Axiomatic Approach"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-gtools
  r-proxy
  r-rgl
  r-rlist
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('af460368b7d2d20aa088c11ece8ac97f')
b2sums=('596b77f5347c52c51f79226798cf02f19c90b8ebd9b28479b552bc163ccba352c007d3502a024c4fb9647bb4db43a96da23179212b6680ed932f0180d4f3db7f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
