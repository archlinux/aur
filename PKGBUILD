# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ada
_pkgver=2.0-5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The R Package Ada for Stochastic Boosting"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('381b8cfc76ee35d9d60fdf78e3aa3314')
b2sums=('f7cc7313164ec5ccf45c388a9bb6b201eaf814b0127c3483d8082b7b93888ed5aecfd6efb3cce5cc86618b8b1ec139607ca38a10e758cc58bfbf379bd0d05ce4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
