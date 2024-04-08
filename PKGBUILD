# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adehabitatMA
_pkgver=0.3.16
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Tools to Deal with Raster Maps"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-sp
)
optdepends=(
  r-tkrplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8c4f737241fa734be5603a940ae86270')
b2sums=('4bd7a3583331aed034ebab62c2e39ae73cdc5e44e135001f47b23fc50908ce6c4cc5191fd9aa006b4bfa61f65a3f8663c175399b94fe9907af40317eb2594d54')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
