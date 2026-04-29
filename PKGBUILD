# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vbmp
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Variational Bayesian Multinomial Probit Regression"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biobase
  r-statmod
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('de054020c71fc5e8ad2c3b242d2114a5')
b2sums=('6673739590c12825811d2a7b2cbe37cd3306b9c7c2975b6d6284ca044ebe4c4729f27a17f027d5d19b74ac618fe93e27f036163c57b7ea60ae090960c744fc3c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
