# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Mergeomics
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrative network analysis of omics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cbed7a299eb2d105e14405c156a621a9')
b2sums=('1533361c8add881dfbabfc0783e4269bbd54958d071e9d5561921985a2385a56ff24745d540b913b0d887098b7b711ba9fa120cf8ea26de1218cbffbfeda80ce')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
