# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MultimodalExperiment
_pkgver=1.12.0
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
md5sums=('8d5019d568c1b908cc9fa1edbcd83d91')
b2sums=('cefe80c7720f5b72d8690750dd26956cb815a0e51b880dd17a84eff6224f1e5907ee82de6efd767ea03cd48193ad5768b773f52750dd4530a02cbaabaab5caa0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
