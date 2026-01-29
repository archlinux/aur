# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=enviPat
_pkgver=2.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Isotope Pattern, Profile and Centroid Calculation for Mass Spectrometry"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ba7a258bdc03b46a280965d693114021')
b2sums=('e30077693c0a94be2d6f6330ca62c16737d153084fa0d5ce4634f65abeea2af6498ebfca17c254326d29226117c18e0b85b41d6791f28d20e87c3c4530ac640f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
