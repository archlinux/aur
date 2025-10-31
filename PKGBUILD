# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LPE
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Methods for analyzing microarray data using Local Pooled Error (LPE) method"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f7df619734d8db722e09d75a92098628')
b2sums=('a80d0f4209c58479ed5c81af0819c03b9a420b98dc24a9e195cef22dda2fc487f40656e60b45a8b52935ecdd0d3d9fad034e20a8bee604d4f50d5ff4518c303c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
