# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LEA
_pkgver=3.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="an R package for Landscape and Ecological Association Studies"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  lapack
  r
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7059c3067df5d46b84ef7c715cc69b62')
b2sums=('ad54491ac377f16b0edfffdd039006f944d3e96f96c8a97dacff5e5a69403f3966a3d6e07660c3ef159ed49739764e6444b62107899c6cb264c68eafe85686d5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
