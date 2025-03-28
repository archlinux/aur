# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gclus
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clustering Graphics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('55a07fea4021912ce125be81f8418fcb')
b2sums=('e7ee6044bcc307e023f5e99545222d91dee26f48cae4cfd07474e42c15a1a45b7abca8efcba75f7624242201365ea185c0f5fae02fdb425aa40880e5049c0a02')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
