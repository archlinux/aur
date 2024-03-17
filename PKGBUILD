# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASAFE
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Ancestry Specific Allele Frequency Estimation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e054d986c3b6f2574c26498eaf6e4f7c')
b2sums=('b8bbd1a6df7ca58bf3e56ab0a8e0aaf4f9490cb498efa90b3bee5d4d4f3922fc40445f980f63613380e79550208dc15d784454237409abf4a7afeb1fb90f6662')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
