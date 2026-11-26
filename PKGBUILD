# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vbmp
_pkgver=1.82.0
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
md5sums=('c635df32b2d5ad4005543efe55a92878')
b2sums=('b9ee3e748f850f0e4233e03e5aeb6f636a8dd6df7a0a7ce18d4d896110319d97073970b6f0fbc6671b971c1d38d64ba29bdd1b794a0648dfe31cc657c29a0322')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
