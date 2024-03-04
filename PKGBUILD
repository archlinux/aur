# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=assertive.reflection
_pkgver=0.0-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Assertions for Checking the State of R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-assertive.base
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/$_pkgname/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e5b52b04481fe2b713a668262fb1c642')
b2sums=('3091e695854ccd6ac3d0febb22e8a45249f21a176b212e37b9f208bafc6aa526a60b2bfca648338b222cd6c7b6a2bb00a70349d3beda891f915e2703cccfaa10')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
