# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scam
_pkgver=1.2-16
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Shape Constrained Additive Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('da181086ac6232b7c63f96663e95ad44')
b2sums=('248e06ab45eeed6dc3494ae98f8d7df043199a8bff036d33e787c7077b102e4ba1dade99a5fd1779a76a2a5fff2bb2d19b3def7fb853b6fbac919bc0a2e72c99')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
