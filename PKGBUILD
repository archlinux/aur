# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparsepca
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sparse Principal Component Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-rsvd
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('01fb3483e1f2b4967be50d64ffca81bb')
b2sums=('08ec3d022598b06e73027972276c5f74dbbca4b81cd1903628cd09f4e797bbf92b060bc310eea60e0a3d692858139ede1acc8bc44fd210e0a5773bc77ad1bb0a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
