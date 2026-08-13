# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=MsExperiment
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infrastructure for Mass Spectrometry Experiments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-dbi
  r-iranges
  r-protgenerics
  r-qfeatures
  r-s4vectors
  r-spectra
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-msbackendsql
  r-msdatahub
  r-mzr
  r-rmarkdown
  r-roxygen2
  r-rpx
  r-rsqlite
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b35110d81795d4d56bc678643cd5b5e2')
b2sums=('57c2417d75b6e9b00a790840b1a858cf74d42608697759c7763f169e56b3cbe116ca645b595196d21819d5329a1b815f5e1c43aebb82dd0f52b3f64eef40efea')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
