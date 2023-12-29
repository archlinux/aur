# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tensor
_pkgver=1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Tensor product of arrays"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('067d8ce235aa25756d178f5548b39328')
b2sums=('2d0c14938aded2884d6033ab10614269898c3ceff8e933c403d580f70c57207853d57bdfbaefe8e3c3cc9a7fd4dee14c1135ace6c4529a25198bc4a9499fb769')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
