# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clv
_pkgver=0.3-2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Cluster Validation Techniques"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bad3bb2af579830b283b0d8b5fa58a6f')
b2sums=('d2bd5de2f2087c5e7d54c245e9db9cd7a30ed872031903ed250ac599387c6f2e48e4c5734f4a40360572d6dae2daf81c2223cd7e1242180fdbefe3e35baa4258')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
