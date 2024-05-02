# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MultimodalExperiment
_pkgver=1.4.0
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
md5sums=('c4f958e0401823680defdf1513b40ee9')
b2sums=('e881051858714a23efe9434ec47baa2497d398f6ad56ed92dc38a08f5303330c5168e7da35ecf6e75edac09e842bce91cbddae3988c8b115166aee46511c7238')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
