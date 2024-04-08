# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sampling
_pkgver=2.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Survey Sampling"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-lpsolve
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('42f9a999adb8edaa1aa1199d1774b8aa')
b2sums=('022baa77d2b46732f55c5bfc451cc6cf900d8d9c5709dd35ca8f73b62e9ef49337c57d28eba01b73180d7f4bb4f83a6eb85d7a860683d6c20a37cd2b1c168bdb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
