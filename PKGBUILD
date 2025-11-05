# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RUVnormalizeData
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gender data for the RUVnormalize package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c36ea47d42e044af2ebc4f2e53175d0b')
b2sums=('e97860e8ac36b95a760faba19d7e7c3337cb98c87c0ebe04d66809e8f7dfbac33c697a5118615943bf951d8bcd6b51467a35ed62da1052fb3fd3766cc6271946')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
