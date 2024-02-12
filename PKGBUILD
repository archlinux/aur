# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=startupmsg
_pkgver=0.9.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utilities for Start-Up Messages"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a3323b47b5dd36fd9db3197c400a1d84')
b2sums=('02d8aa60a35dcd9875c75b1a76a06def9a51909fdc7121945be4d5edaa65f6362cf7c08821ede7a65fc87a6f40c1acefdc4693f8f85835b68a2db8bd1366117a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
