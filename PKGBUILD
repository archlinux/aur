# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COHCAPanno
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotations for City of Hope CpG Island Analysis Pipeline"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('56325c006a552c16653f639e83ecd6ba')
b2sums=('e0d28be0bcb7271e50586eaa7c5aaa3bd234a1d76329d7e67c04f4f941f068b1da5c9635f1465413554f8eb342b0ffb29741229abe1026fbcbb3c311bd3b1167')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
