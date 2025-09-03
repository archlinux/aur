# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ClassDiscovery
_pkgver=3.4.9
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
md5sums=('c4e5a4b8aabf9581bb02e6c8a1fff63c')
b2sums=('d4eb97ade10011960137d762baec1ca6ea0645e6a2f2fa06bac82cfff4e1b51d86667a409d2cce61e04dc5f5da0e4842072ced67455fd5ff3b46be551693d6b0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
