# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ClassDiscovery
_pkgver=3.4.8
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
md5sums=('787b5121a45bfa84d3f2719a3aff9d2b')
b2sums=('b9bdf0f119bddfb4032a6a114cb7b4a758f0fdda030de50850203b3152b91dbbbcf202579e063a26b2cae142864cc4fbc15e57a33303500297ebd4f4051eb197')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
