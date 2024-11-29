# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=distillery
_pkgver=1.2-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Method Functions for Confidence Intervals and to Distill Information from an Object"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3a84df647e929ce9b8072ce1354ab3ae')
b2sums=('82d5aa376818c63c610467b3678693bd0c1b2fc8d4d33b190abd5420e9133555b410201bff164b9f22d74bf3d886588bdea0656cb7e2194824efd3c44bd434b3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
