# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RolDE
_pkgver=1.12.0
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
md5sums=('3488b6fa0319a155e37baf7048e22758')
b2sums=('d8796cca6a16f1cd3bdb94b5ed12631067caa8ca32826998bd0511b1b2ab5ba7715f24c1084ea587db63c0a96dfa12af0b885d864a0c9946cc2fa46455fb4de4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
