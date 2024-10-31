# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBarrays
_pkgver=2.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unified Approach for Simultaneous Gene Clustering and Differential Expression Identification"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('42b160cbe3852901a1e5b964aff75c42')
b2sums=('d1e02ec336d14109b607b729c4b2290edec2b1818c92850a3ae6dd7aa55d44967cacbb790ccf0024beded13058d41d1326c0738d348ea2cf4a6fb41e65b5c4cf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
