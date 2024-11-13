# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=skmeans
_pkgver=0.2-18
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spherical k-Means Clustering"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-clue
  r-slam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9720b156d31e7f4dbd6de5bcf611a453')
b2sums=('7734d820170019a795a13bc7c0828c02ebbcdfc8bf29cf9b1cdceb456fd65afdddb0841c9c89cc29034141e276ba3d31d2649d44b1b9dfb5bae99d67a73b0819')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
