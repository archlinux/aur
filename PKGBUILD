# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASGSCA
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Association Studies for multiple SNPs and multiple traits using Generalized Structured Equation Models"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('90ef625503107f317b94142820c3689d')
b2sums=('9f80db1398a0471935d80145b25bb2669637307a98dc51161d4963e849636764ad119d9b4dba71e8e7205761bfad8d01be2e70bdc54514023350e229b976844b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
