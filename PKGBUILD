# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gcspikelite
_pkgver=1.45.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spike-in data for GC/MS data and methods within flagme"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f602a5fa01e871baf97e878ff9c176c4')
b2sums=('86eac27eae2cfd29ace1a6ec7d3e49d5de856ca2e6680dc81b94cec521e86a5175f2468da3968caf14cb981837e92347d99671b6776f5f61abd00c8a019d33b0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
