# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tester
_pkgver=0.1.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Tests and checks characteristics of R objects"
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
md5sums=('8deb8b7e9761a6026a4a1800c200c8f0')
b2sums=('9d5ea2bd156a13ca09546c9096d4d22ff8cb867f28a213122dce7fe535a8b7a260cb9f376b6d875acacb99d0cb51d877973760e9dba40ef2249600b0a43cb3cf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
