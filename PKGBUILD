# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gamm4
_pkgver=0.2-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized Additive Mixed Models using 'mgcv' and 'lme4'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-lme4
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dff478c7c80f51c0356df39347fdf9f5')
b2sums=('1d6ea478da815f23c9c986c8d4c3acf9c5b57eaa923e627a3bf8d1b8c07920f48fffd98aaeff5ef8b8afafa5176337f2fb42002633eb0e04b8c6eecec0dce02d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
