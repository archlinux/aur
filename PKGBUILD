# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=curry
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Partial Function Application with %<%, %-<%, and %><%"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a2d43da3367e9506e4e4e8a4523faaf5')
b2sums=('096e547915dae45e9f05a2d0c2ebec6aaebc12c21b192a5ee0e73f64ea909335571eb0c40313f4bfc9f29edc4d560db927b1434f4301680dac3f2e570d32a390')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
