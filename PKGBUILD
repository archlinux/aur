# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=xlsxjars
_pkgver=0.9.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Package Required POI Jars for the xlsx Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rjava
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1dacce14c99d62dbf280f975d05298f2')
b2sums=('b065e03285b8590bc79ee14a68435eab544e6334dc300dc6f0695a5461503f27b3c052f6cdb90e21699919d19fac61b999808df7f09d17df4f3a2b36352bbff7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
