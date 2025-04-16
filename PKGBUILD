# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seq2pathway.data
_pkgver=1.39.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="data set for R package seq2pathway"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('de8d51527350fb1862b056b9294a153c')
b2sums=('aa0cd6c6c0f73f3d7bd3fe8e1f2dc754ce600bd3c80cad4fd99dfa51f6eb1cac659a800052aa1cf8e10d634526e45e621b2eb3af40a36db6638756140b11a477')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
