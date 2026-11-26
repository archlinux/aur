# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sizepower
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sample Size and Power Calculation in Micorarray Studies"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fd31d1702f9db83f9b15b9328748fdec')
b2sums=('d35bb13508a6c5ae607ed86b702be2865dafd97fa58fdb5d09c8ed9ab0dd74c1645f8a66e4dc80f4621290b941a5099623c44ee5cb706c136593d9973fbdd637')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
