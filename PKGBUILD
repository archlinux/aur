# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ddCt
_pkgver=1.60.0
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
md5sums=('31e82a9d515c53d746d23e4644d77fac')
b2sums=('37f77d0c4efa6598f089b245f06943c712fda442817b3a351ae27a6d0def1d45e9d4074541be855c39a4cd56f423d1d982c072c02d6b04923ea8c1a1efa06d92')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
