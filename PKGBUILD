# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RolDE
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust longitudinal Differential Expression"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-doparallel
  r-dorng
  r-foreach
  r-matrixstats
  r-qvalue
  r-rngtools
  r-rots
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-printr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('36d0e8d7a7ed59c691e8ca4312cf0478')
b2sums=('de0c39107ecc84a2bea064ba202f340172b969f22a656dc3ea49b8b7e0f37d587849be7ef02f60d431a989a378ff66aeaa86f0852069452c265871f23e9c5b43')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
