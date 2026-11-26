# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TargetScore
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infer microRNA targets using microRNA-overexpression data and sequence information"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-pracma
)
optdepends=(
  r-biobase
  r-geoquery
  r-gplots
  r-targetscoredata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('906b5e40bf651d05b57aec232aba5708')
b2sums=('a35f027ad91db92fe282be929a814ca58c82d2fa2d3a88d281c4f0c8dea30f3dcd304d5b0a9539c2915880ce38e040e0aac373c5e28870368f828c7f3db2e55d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
