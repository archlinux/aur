# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterCrit
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clustering Indices"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  lapack
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-rbenchmark
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('29e3fc066da888a43bfedb048d932e12')
b2sums=('a59cb8bbf6d223d09bb7b06f3279be929dee9875048b92fb9bdb6d46cbb1b60902af4c6d6d17ca3135965090653986cd6b399936f3b0e7e2525ee44334c3fa1a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
