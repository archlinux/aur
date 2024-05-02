# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iASeq
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="integrating multiple sequencing datasets for detecting allele-specific events"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('61332aad003e6ee25b2ea699b5889ea7')
b2sums=('44b5751f7b45393f8500ba1655f21562ed6bc2d036abb86451d35f3ae9d47af3ad755f5b38a4bb1dfd8487f5b96b1f50c2407e879bcf0485c020c77ed41b9f62')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
