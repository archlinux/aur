# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IMPCdata
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Retrieves data from IMPC database"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Apache-2.0')
depends=(
  r-rjson
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c4a243d4a15f680abfb5d61a951c620d')
b2sums=('aae60f49b2cc4832f2a4f2456e4f29e0757c22e78f40ae84db8dd8787c603ce3279bc7104541759407c6dae2c2d0ec1fd11e6bfd2c14a7eda0020c0c08e9b115')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
