# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=strap
_pkgver=1.6-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Stratigraphic Tree Analysis for Palaeontology"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-ape
  r-geoscale
  r-pbapply
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f1d88fdaaff0570774ddc741b35a0f4e')
b2sums=('cd6dacede41922d2c8de9812ffdb011a50ac3a6de70e8a0c2bdcf7013e0b58df11e84c646313826f22f3d11622e7d0200991282b6541e2ba4cdb2d4395c0bfc2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
