# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=Exact
_pkgver=3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Unconditional Exact Test"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-rootsolve
)
optdepends=(
  r-exactdata
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a026b58b9e016ef56f8e07d1a910114c')
b2sums=('031c565911047d3d5906ddd71cb538e2d8a6c9bc92c90a62124162bd22d192d9e6afa08515f60648e1b58d3d63c4b02444cc1ce1c01216d4677bff40a926baf6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
