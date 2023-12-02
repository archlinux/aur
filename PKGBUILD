# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RankAggreg
_pkgver=0.6.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Weighted Rank Aggregation"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
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
sha256sums=('bde95b55e052ad3777a9720ca970a438f5f3ba37798a12c77dd89cb39db4e0bc')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
