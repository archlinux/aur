# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss.data
_pkgver=6.0-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data for Generalized Additive Models for Location Scale and Shape"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b4e99b33bcc8f4307656d61279c611fc')
b2sums=('61ac6755a9e2ee12e4777ac8e75a86c0a2f1d052dbcfc1373224ebe2bca1629c3392b4fc0b7eaec7ac5552534df4851377e3a2d442369def50f1f3479897f2b6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
