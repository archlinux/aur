# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RankAggreg
_pkgver=0.6.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Weighted Rank Aggregation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-gtools
)
optdepends=(
  r-clvalid
  r-kohonen
  r-mclust
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2b54df8fd2b0097ec6aa80d607fd53a8')
b2sums=('3b8822e9684cf13f35d4ebc3a8efa92d8eae64249037cf6789073c821f8d8caa87897e4a3511f4dc7c47a09ca7a727755ba3e3c7f47eefee6d4ec6ce190f2e50')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
