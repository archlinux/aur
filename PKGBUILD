# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=smatr
_pkgver=3.4-8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="(Standardised) Major Axis Estimation and Testing Routines"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('61b1d814b07de91043918aea12ca52c0')
b2sums=('f8f874f057b0189b0a6ff048f7504698dc0d25ccd39542e84d68424bf1a1633333c9fe7837fa6f45bd1def67676c453ee68883c4af1528bcab2b756d8853c452')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
