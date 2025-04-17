# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HELP
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for HELP data analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4989c8c9377b704ebdbc2fe52fbca087')
b2sums=('863d26d6f1f5ec3d543e47a411f2a71c23ec85ff97d4a972175e7e712ae3dfe74c6d67c3a4288eab56dc668af8e787b9517aabaa757b40d0f8079d6923b4e512')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
