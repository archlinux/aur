# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fishMod
_pkgver=0.29.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fits Poisson-Sum-of-Gammas GLMs, Tweedie GLMs, and Delta Log-Normal Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1d042be2a051332dd469b0626aba446a')
b2sums=('d386f9d00c369f65b623a6d275acd70ff3c963745c1495b58ed1093fbf3d64e026e567b4e1f127818e072ad7caff5e9f922dad208091c9ca331544bb792be1ff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
