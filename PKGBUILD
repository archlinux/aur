# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HybridMTest
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Hybrid Multiple Testing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-fdrtool
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a2b1764b0e458f82e6055a3ebdf90933')
b2sums=('5cf6f18ee78817270556858f36d2048a99ae9848a0b0a94d17220aca293de089b6c88a78bbcabc428c6c629ed671079fb2e7261579a5dca38e100715ce601aca')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
