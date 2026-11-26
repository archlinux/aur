# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DrugVsDiseasedata
_pkgver=1.49.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Drug versus Disease Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('86338d6aeb28591d7d84c7f3f686783b')
b2sums=('c52536b081d77329a1ffd1100ad54f948d9f07d6734b42cdbaf3c25be71f4bb21d710c62f5677c5d4c440bd4b1c273657028fb6d490ecd382b828dc5ee0acc93')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
