# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cMAP
_pkgver=1.15.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="A data package containing annotation data for cMAP"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dbf8df4d4540151936884e1c5d747bcf')
b2sums=('3cab3a02bddfffa13f06049718f4c4f3d8366fcfa942b066c7884b055b5474884fa9341ef343231781022a75256901d74b5fcde2c3be8cdc7122e59c06261a8d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
