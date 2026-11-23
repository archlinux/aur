# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=Chromatograms
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Infrastructure for Chromatographic Mass Spectrometry Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-data.table
  r-mscoreutils
  r-protgenerics
  r-s4vectors
  r-spectra
)
optdepends=(
  r-biocstyle
  r-iranges
  r-knitr
  r-msbackendmetabolights
  r-msdata
  r-mzr
  r-pheatmap
  r-rcolorbrewer
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('adfcb8c6ee26966849d881441d4802cd')
b2sums=('00ac3e11423f87301c0e5a58d497101a9cefa8e9062fbf8c5c9979a9ad79dc8c8b24b553cf56665f6717a1b941dc17cef207ad9522d99a3fde91bb4aed8f1c36')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
