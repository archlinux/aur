# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=statip
_pkgver=0.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Statistical Functions for Probability Distributions and Regression"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-clue
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('afa8bc4b690cf4a275a785800dda055a')
b2sums=('e999d52b7f14383d1755cda1621b382914a0d8f5c26187a7245c776e7b9978485de493d134ddd654dab4042fbc1bab87ce1531631f946cb5e27b05564e4ad035')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
