# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clue
_pkgver=0.3-67
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cluster Ensembles"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-e1071
  r-lpsolve
  r-quadprog
  r-relations
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4048cf65bb2786167e28f7559d2e0c39')
b2sums=('b7ad4b4ae9df08a7c63ab537536e0c7d5a5930340afd8f09498b117feb73b55a9eebf6b22dbb9b6a893df855a68c156cf425da13e3cda7964e63c3a7f8459d1f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
