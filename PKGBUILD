# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=calibrate
_pkgver=1.7.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Calibration of Scatterplot and Biplot Axes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8b244af41c298c7bae178b6a58ee422d')
b2sums=('3e7fc9dc73a32f81f9fc8619ad15f5b018b19e005ef7c40aa50735a1f771125b53a1280e932947694cdd0e99f5c2be081a535cca75a98410d83faca51d9bdb37')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
