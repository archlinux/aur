# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ClassDiscovery
_pkgver=3.4.11
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
md5sums=('cf85bcf76824632ed1be675b14eeb49a')
b2sums=('643d05e34d6d8e80bec955632c8ef8acaa0c91cb589cc6ae71f648bb08ec20f989a316c2ec555b679d2192647457405e99591e83cba19a4bcb3e6bcdbd9c4b57')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
