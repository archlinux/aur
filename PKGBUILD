# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multtest
_pkgver=2.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Resampling-based multiple hypothesis testing"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-biobase
  r-biocgenerics
)
optdepends=(
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('267407926d63a1a6d1f35019bfd3e0b5')
b2sums=('1f16b42b0b580b08307ca8cf166d12ba89ed6db4466ec37bae74202237779ccb250c2e3a4d3911f9c172e9bc04a6919f6096fd69d6c1416f4cf6ed85067a17ab')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
