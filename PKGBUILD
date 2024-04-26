# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=AnVILWorkflow
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Run workflows implemented in Terra/AnVIL workspace"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-anvil
  r-httr
  r-jsonlite
)
optdepends=(
  r-biocstyle
  r-knitr
  r-tibble
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('af890e3cea3c42346ec887603ba12e40')
b2sums=('241b785fa692618be8f1d8f612395be2d80af8d81360d395c317bdf6b7824d16dc11a96b01aeda76c8eece5b0243ba5e15a829f2db95582400f103c300e77ab9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
