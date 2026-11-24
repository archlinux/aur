# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ConsRank
_pkgver=3.1.2
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
)
optdepends=(
  r-rgl
  r-plotly
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2b7ab67fa12a1e48ee366f4b129c4717')
b2sums=('c8e64de01be4cc816e2a9109b99273d690f6e273e7476af51d34b6972a4745ead9c370bf7c95fddcc40ce63b346a906aa6c271bd69e37bbef83c5e0edc39ece3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
