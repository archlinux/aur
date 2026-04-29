# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ddCt
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The ddCt Algorithm for the Analysis of Quantitative Real-Time PCR (qRT-PCR)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-biobase
  r-biocgenerics
  r-rcolorbrewer
  r-xtable
)
optdepends=(
  r-runit
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b9c4d5535908511e0dcd167072ec573d')
b2sums=('7186c79ed17a84d1072d68bab13318caafa2c8fc90dcb8d8f8f8ff5d0179d2e4e0b86d56944c853fffe6da3beb1304252e8423a0555f93f4be89cf2af25c13c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
