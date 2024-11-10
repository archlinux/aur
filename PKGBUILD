# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=MsExperiment
_pkgver=1.8.0
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
md5sums=('5b2dd4750bc74cf3ec8f7748b6f21891')
b2sums=('382f3e824c8b951f41e0b384d61bd958ece1bffad03db74981d51b1897046022754293054e94a510033c9050029f006bdb1255cf986ad508ae7edbf4fc304b48')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
