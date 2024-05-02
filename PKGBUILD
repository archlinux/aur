# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vbmp
_pkgver=1.72.0
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
md5sums=('588f887978efb059a12e38fbc42cba4b')
b2sums=('47830f760545d17f93f5b0d57ac714d28597e999bffa8292f171fcb88f70c271acf8579e8182e9328c62879ee6afe30040ef2a893491584afacba08f517b2d06')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
