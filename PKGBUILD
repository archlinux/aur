# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=knnmi
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="k-Nearest Neighbor Mutual Information Estimator"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f33a1eb2e0bbddefac3a72ce27d96b1d')
b2sums=('ac83dafd24990405bf96c056f49cbcd24aec12e63b32024d5ae1c0889779754d6e0f71806ca0af1e5002885fd51a9625898dcb678c664bc30f52f648382b0d3a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
