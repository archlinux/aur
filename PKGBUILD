# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=occugene
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Functions for Multinomial Occupancy Distribution"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('264da1422714d735ac474b414e57a2a9')
b2sums=('d4c6e74a1272b0cb571985d9e4394fae243eda4218dec02a9887ab2b3da881da4ce3bb76a4ca637083966814d530833ce1aca61febc686473ba03acc9e02fabd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
