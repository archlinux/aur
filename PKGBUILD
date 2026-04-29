# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASGSCA
_pkgver=1.46.0
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
md5sums=('7be3a1c1bd953b61d77522b9cbb42bb0')
b2sums=('568e299c75f40d71b89dc033a3bcab36896214d0d5c0061727c58f57eb15b679edc13c34743a341b845fecaadc6583a91b877f3af726767b1aa938843e016eb0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
