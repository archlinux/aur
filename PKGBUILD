# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RolDE
_pkgver=1.18.0
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
md5sums=('0ada7b1e7d7072403fd649614ee7131f')
b2sums=('c510e9fca1b016ef0a55e8a9a3abcc6912eb53357433b08b09cc0d6595ad265b189817195a74d35b5311eedbb85cd7bea978830153a20fa0a36e98871bacfe2f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
