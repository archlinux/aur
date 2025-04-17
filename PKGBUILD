# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RBioinf
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RBioinf"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-graph
)
optdepends=(
  r-rgraphviz
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1d10312d0029c46d0e9db78eebc17a89')
b2sums=('a44fb198270b017d5df946194a6fef4c6fe2fc8c00b1e73a1fa850daccea6572f829fca90b5b454e18e97fbf6dae21e7578766ad4d288b9185fb663a255816cb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
