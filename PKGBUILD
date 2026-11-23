# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ConsRank
_pkgver=3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compute the Median Ranking(s) According to the Kemeny's Axiomatic Approach"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-gtools
  r-proxy
  r-rcpp
  r-rlist
  r-tidyr
)
optdepends=(
  r-rgl
  r-plotly
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('579a83ccdd09138344ee5b3c2cbfd4b2')
b2sums=('924ddefe4161fe2a0341fc43f87dd7a180c5b810b5642094c3ec958ac70121599f0fe57c1aac40916ae7b341e2b870136c67ed77336cf0ca4f370994457d0fd4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
