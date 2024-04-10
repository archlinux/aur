# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MuMIn
_pkgver=1.47.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Multi-Model Inference"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-insight
)
optdepends=(
  r-gamm4
  r-geepack
  r-lme4
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e733ab93b8e3cff6e827c04634f54976')
b2sums=('82ca98c89b4efcd8d6b3c57feef7f9e343936f30d4a640c89057c7bd93638ac79b2aef8e8ba7c4718cd1c96e1409f1230795229381bd040fb6f196b16023b5cc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
