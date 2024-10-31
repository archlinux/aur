# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RLMM
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Genotype Calling Algorithm for Affymetrix SNP Arrays"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f8b6b4bd9eb1d640055893d283d6b0a')
b2sums=('17325dde5fbbe072a60b4d4819b3bf064105e05ff592573a8316551c3a78f22591444d8a61a0527d870b9b70ecd8faec57b0b995a9600908e0b472c4a0529e9b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
