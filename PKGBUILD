# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ClassDiscovery
_pkgver=3.4.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Classes and Methods for \"Class Discovery\" with Microarrays or Proteomics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r-biobase
  r-mclust
  r-oompabase
  r-oompadata
)
optdepends=(
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6a49c8af59d21a5aa4125e70a1971700')
b2sums=('ef5bf133992bb3117895ad28a13575f2a36b2496bce0f19b46266f4ca74ee991d72aa30c9abfc4dd1ac53cc37965e19c4197a02adf8b36bde2565ddbd02d5c8b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
