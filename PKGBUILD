# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=poweRlaw
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of Heavy Tailed Distributions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-pracma
)
optdepends=(
  r-covr
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ff558429b0487390f782db89f653bf83')
b2sums=('6529fc5ab5979145526680ce4da2bcb197b2d3132a77fb8efe15405bd280572d91037161de0970f684266f127c215d77ad1775c4f5550e4de9f03157cccf7abe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
