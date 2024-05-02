# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RolDE
_pkgver=1.8.0
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
md5sums=('6bd31a548e7ce7e430f3d88170a92c6d')
b2sums=('8a3f6d82b6a19602861a8015885cb7111c9de2116c3d001a330d596d489cb753da789fd78c1c9639e47bbe323d6fb9f5d4dd04c0c847d8265742a06417470fad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
