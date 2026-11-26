# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HSMMSingleCell
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Single-cell RNA-Seq for differentiating human skeletal muscle myoblasts (HSMM)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('93841bd3fcc8dc55d78b1be81b133f6c')
b2sums=('debc3b8eb5107731845af873c173972bd4aa5cd471f093a81f1a171d56a849a3609db3240d539407be7bf7f338460535b494a5aac4ec02015c741e8db3e7236b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
