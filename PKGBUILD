# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dismo
_pkgver=1.3-14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Species Distribution Modeling"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  java-runtime
  r-raster
  r-rcpp
  r-sp
  r-terra
)
optdepends=(
  r-deldir
  r-gbm
  r-gstat
  r-jsonlite
  r-kernlab
  r-randomforest
  r-rjava
  r-rocr
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('df359ee83b53c4a8953574f1a28b62ef')
b2sums=('844566e185ff125c3c48e474498d7012db099230b7e3c9822701ff60cb3d6cdae614e491981496316e7db6b8f346540bc8f97c01d72311441a934fafb28a6e87')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
