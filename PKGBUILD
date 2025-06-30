# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=MsExperiment
_pkgver=1.10.1
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
  r-msdata
  r-mzr
  r-rmarkdown
  r-roxygen2
  r-rpx
  r-rsqlite
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('27b205bad3ce344bec946f99c2ac1788')
b2sums=('14c3d97619b0a3dc98ccb4711a6799405dddc3c3bdacdab9a048b037d89df8ded91cf40a9d5002a3066fcd83bf657b4213eadb5e728a2d3f6a8d874cc3c48556')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
