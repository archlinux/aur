# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=JASPAR2024
_pkgver=0.99.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data package for JASPAR database (version 2024)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocfilecache
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-rsqlite
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9c8144547873a36473a5f9cad793f578')
b2sums=('5004a5b32dea164588389586376b0dd52303c989dfe1f72a2784490c7f328b697ef7adc2968601542f8ba80f860c87ad571693a2ae955c3fa361022493f39eb2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
