# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dgof
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Discrete Goodness-of-Fit Tests"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('790f5042be6c29e3f1c126075492801a')
b2sums=('96b26481bf7cdcaa50b7719c72982193e10a5ab3d783f52621e6b807557a5f6a7718a8e56b6032cc1d24c813d85ffc23d8d7c50a8dcab54415c6ad5a078d96e2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
