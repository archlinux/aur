# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DriverNet
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="uncovering somatic driver mutations modulating transcriptional networks in cancer"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('07ea0e3f248acbefd603bff44ab682fb')
b2sums=('28f676e9691186e2b88e8e9c3efd5987f881572b1a342b7ab26971874b28f624ff6d5694c72011403c94f5426e5a2523a085191f31a3b897dc3e632c955a93ea')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
