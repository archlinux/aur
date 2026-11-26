# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=Chromatograms
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infrastructure for Chromatographic Mass Spectrometry Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-data.table
  r-ggplot2
  r-mscoreutils
  r-protgenerics
  r-s4vectors
  r-spectra
)
optdepends=(
  r-biocstyle
  r-ggiraph
  r-iranges
  r-knitr
  r-msbackendmetabolights
  r-msdatahub
  r-mzr
  r-pheatmap
  r-rcolorbrewer
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d648dac8b6b952cb8ebe7b14123af795')
b2sums=('9050abd74de6f627fa0ef08abc51d006da2c04c5f67eae14a6bebae853bc7d9e27b7eca74282f3e4e7c65bcfa942831955cc5112cc684966ac4b03645d52af77')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
