# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tximportData
_pkgver=1.33.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="provides the output of running various transcript abundance quantifiers on a set of 6 RNA-seq samples from the GEUVADIS project"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-markdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dbb60e5b13f77684699300deff1413be')
b2sums=('d8ca6d5298bb257b07901e7fa1b0de1719d1f0cb5d03b3c4032e503ffe0f173ac0e6d905b4ae84fd6f1747e2bfa03ec27beedc67f14ad852ab5db242aaa8271c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
