# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GSALightning
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Permutation-based Gene Set Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-data.table
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2d33103076f3e69e527af27eaf2595a0')
b2sums=('7e1b069bade9d33f7699567346cad116f04ecc79c97513c870f7f245abaa5769a3fbb0bc71ff0672e96d751ef1e0e5859c88e8b7ed359b371e47b94435c4f0d7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
