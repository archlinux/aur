# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gsl
_pkgver=2.1-8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Wrapper for the Gnu Scientific Library"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL3)
depends=(
  gsl
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('357bceb886f42b70fb2056a401d5c401')
b2sums=('6ed36abbe9f764b4157c2c0d0b0e3553770601a10858d2441af53de9a81277c0c35c81e1a3703784e83f7e7cbd71a3662716d3e8e519ca87bf937ae563547ecc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
