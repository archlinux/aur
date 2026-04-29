# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=occugene
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions for Multinomial Occupancy Distribution"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('75cbef3a848abd4fa0accca5a2057521')
b2sums=('f5b67b1067861de70dccda5370c305858e345c774aaf10805caf42e855830c269cfe92b2b8fb72e5ec2c71f21f680db914fd5961e238d3ade6891f6e2cd63448')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
