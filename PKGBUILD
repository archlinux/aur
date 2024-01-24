# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ConsRank
_pkgver=2.1.4
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
md5sums=('eaa7f5278805dd3564a6bd4ed414fcc9')
b2sums=('df7a1570f27167a9bb94abfb6ed40dda53c2f5a06f0e91a5fa19803070257f0afa0ed7ba96d04716993ef35ccc3848e84c62c212045097d64c24a8a6c17bc168')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
