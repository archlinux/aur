# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=limma
_pkgver=3.58.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Linear Models for Microarray Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-statmod
)
optdepends=(
  r-affy
  r-annotationdbi
  r-biasedurn
  r-biobase
  r-biocstyle
  r-ellipse
  r-go.db
  r-gplots
  r-illuminaio
  r-knitr
  r-locfit
  r-org.hs.eg.db
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f52a816d0d34b01f721654f90a1fb5f5')
b2sums=('f55d2870232062b26677515a620b0b0543e0140b1b3cd07fecee5664ab6035ae29aa92992957e58018b0b3ac9e5e97363970610df93970dac8973707e5ad9ab1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
