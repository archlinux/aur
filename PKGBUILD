# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GCSscore
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="an R package for microarray analysis for Affymetrix/Thermo Fisher arrays"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-affxparser
  r-biobase
  r-biocmanager
  r-data.table
  r-devtools
  r-dplr
  r-rsqlite
  r-stringr
)
optdepends=(
  r-geoquery
  r-r.utils
  r-siggenes
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('80b3d2f6dfd1ff31fc433b40443e13b0')
b2sums=('0e90d6b87e296ea36889831c7a0c602f9e24a8ee4cd80a2577c60fcdfe10ee4dd8d37a55d90c7970aff3fa2897d832c79a6ce92753023f20a21a48fdfdfffdd2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
