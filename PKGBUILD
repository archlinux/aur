# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=norm
_pkgver=1.0-11.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Analysis of Multivariate Normal Datasets with Missing Values"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('727b4fa17f06231ab8368630d40d2609')
b2sums=('c0365d8956dc1f07278a843083bb9e9dae1b7d77b8a31f96829760af8732802a7a9e65f9fb917ca5eeb1df4a453ff36aad1180ca3ed9d1fc7f3adf1374619533')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
