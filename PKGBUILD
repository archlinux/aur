# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=preprocessCore
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A collection of pre-processing functions"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  lapack
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f7d48eb2367d5df5e980f93512a4e262')
b2sums=('68669efe9c6bb8bbcd0f0c74ff31f1de0ff23ba9f2115f02ee32dea09a18403d5748b6165f2558596b5f4e247e4b2195412f16d3717cdb407942f76727d2f89b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
