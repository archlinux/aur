# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LEA
_pkgver=3.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="an R package for Landscape and Ecological Association Studies"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  lapack
  r
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dc3a581a78477d4910e29a0f94d81c31')
b2sums=('1fc769295b131e8583fa478b80b0edb7a421f5ef8b0ad5e9d86d2a230ce573c033dbe32541093f9cd7aeb0bdf431f884ad06eefd546bee4c668fd6345dabb4f3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
