# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ddCt
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('560588380b356d55a4e11811ae9100e6')
b2sums=('0ab2bc2ffb444edc8edb9d00c0757f5f37b9abf8fb5f495e555d28e1629c7dfc1584702c0cc02c387e61ddfb9ca07d3d061b1b2e3ca0e574e6a9fc0ad9e3e5fd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
