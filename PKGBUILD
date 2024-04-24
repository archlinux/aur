# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=preprocessCore
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="A collection of pre-processing functions"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  lapack
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2116c6363074b59becdaf7a1e88caf91')
b2sums=('4f757ebf2690449f91c5784ede1da5069b26e750cafacdfdb9791363a2037af675829fda27189987c54fde4b99dbc6d38f60ccc6171a94d92feea3ee3e0e3555')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
