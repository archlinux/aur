# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tximportData
_pkgver=1.31.0
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
md5sums=('9e60f00e8b8c35606fc8d38d64c87206')
b2sums=('94a4ff045c21cd8bc54e9192a52fd61459d7c836c88d016397462919cd69705291abb5e77ab81edcd04dbd2a815e7a3b68ae8a7cf0cf6c731d86b875a67641d6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
