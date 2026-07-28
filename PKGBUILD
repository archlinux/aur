# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ClassDiscovery
_pkgver=3.4.10
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
md5sums=('2faca73e8ef3d1f54c74ed3d28075fe7')
b2sums=('cb25da04063ba42a5b73ba8e7a9b07ce0038cf11d46aa584c9f20edd3fa0047325ba49aa29113d2b5512b1f15a3af1991f9fb9c838530151c00352f6adab9efa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
