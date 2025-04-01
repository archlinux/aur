# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distances
_pkgver=0.1.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Distance Metrics"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aa8cd9bda565a964e043432ba2f7c5bc')
b2sums=('d969fb063d2c3b59f6179ec2a2630e320b1ad91c0cf77b3b6583fe8cc69c9d250c50caa1f64226598346730a9328f0375fc0eb1fcde43a59436d2b6e3084d908')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
