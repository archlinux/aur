# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lassopv
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Nonparametric P-Value Estimation for Predictors in Lasso"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-lars
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d539e6109681125bae8190a60c04abe3')
b2sums=('d201261514d614d414d383c436bfcea6af94c38509ed94a294687c3955c272d1b4af80a0a9ec294fdf73175703232fb172fa286d0d023f630f81c3880f4fd641')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
