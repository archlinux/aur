# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CDFt
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Downscaling and Bias Correction via Non-Parametric CDF-Transform"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('22c933028acbd9614ee76885c6cab648')
b2sums=('0f97abba49412ff04bd86308107e62939225d4384c359ab03ec79ba0a7475425c0f776d3ce0d195036a07bcd70a3eb744dbd67196a399d661c33d7d8aefc5d86')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
