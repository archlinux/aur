# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=profileModel
_pkgver=0.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Profiling Inference Functions for Various Model Classes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
optdepends=(
  r-gnm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4e6b2c73ecfc85cc289c0612fa27c33e')
b2sums=('6dbd8543d97dbf6b193d167aef0e177b7dce9019b0658f3d1c3a3273ddf4de0855543419538cee7a3609d0113aa862d9534d6bb6a789695e1d6cf662065d0113')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
