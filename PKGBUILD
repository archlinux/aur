# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rbsurv
_pkgver=2.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust likelihood-based survival modeling with microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c3debb33bc59b1a4e1c71904091c7f91')
b2sums=('1a4b2a3b7fca381776184f18f18c42ccea66d98793eda89a4b31d473a764232bdc82a762ad70d0d531a00123a924eea57a1910aeeb10b298ccfd8d679b921d6b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
