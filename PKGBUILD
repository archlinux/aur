# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MultimodalExperiment
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrative Bulk and Single-Cell Experiment Container"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-iranges
  r-multiassayexperiment
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('48415565bbd9cb96dd8d264d58c7d034')
b2sums=('fee2f7a7402b3ccd3384748ba6a5fa6f82813fd3f5f00fd6398e779287d9d7f93dd37e56b037f7598865d97d981ce809a6503dc844b97fc51ce9540bf75c36f9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
