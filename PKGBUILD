# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASGSCA
_pkgver=1.42.0
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
md5sums=('0c91383d4c7be98a6504665f3c91b37e')
b2sums=('76e0dd1dc31cff3476348e7556959fae960979314ab17b3c1537e182d50876db71125711f7f5a2951f0775a53bb890ed664e2c4d28df8560fe93e8c7bef94423')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
