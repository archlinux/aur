# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=MsExperiment
_pkgver=1.6.0
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
md5sums=('c95f1ab0bb76378e8994375e9a45b008')
b2sums=('302f474448f7f758b37c2ff2e849fa9ad9be65bf99cb4008f5bb84f4edd9f45875c73d7a8fa4af309b4084ed75369c27bbab177cee98e1caefc4f44fbd106099')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
