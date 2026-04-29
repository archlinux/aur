# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNAnorm
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A normalization method for Copy Number Aberration in cancer samples"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-dnacopy
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e60749235e443e0926f1625d2fcc6501')
b2sums=('d47d993cae590b5f1fbf6d9fe843ca3b14b87e9427364b90fa93a0d30a9a2d8c6eb439f647f534ee00b6297fca9cedc56f009b963bf3db4d216a24615f61d071')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
