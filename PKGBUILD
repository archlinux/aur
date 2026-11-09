# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tester
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tests and Checks Characteristics of R Objects"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('63a721cd2bb48a340195cec64e036548')
b2sums=('11f2a0fd22eff2955dea8b5b3c80e98502e4e9293388f0bcd65f6a075a772eac121c4def7b6b8fb35bf76481dd0fb680ba97d3124db1d7611bbbb67dbd347c4a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
