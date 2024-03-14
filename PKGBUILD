# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=EMT
_pkgver=1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Exact Multinomial Test: Goodness-of-Fit Test for Discrete Multivariate Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('71a05083cda0b119a751905a1512e83f')
b2sums=('27d2a5a9ae939b106bf99b665459d9829cc3ca03088e3d133a47c8170e7ca58812102d9ee71b2fd406ff5eed084cc125111777e27d9e34eb8d5a92d33ebdcbe0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
