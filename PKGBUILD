# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=survPresmooth
_pkgver=1.1-11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Presmoothed Estimation in Survival Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5ad1dc74295f383c18b8b9d285592c21')
b2sums=('33fde0607be8ec0437e780a1e1e3141720842640e6bbc2c91fa359df6bda2d1ea5d0b4cd8710fa3c85c99cfd21d6227e4134651997e864cc0ef75cd43c13737e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
