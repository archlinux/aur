# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MassSpecWavelet
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Peak Detection for Mass Spectrometry data using wavelet-based algorithms"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-bench
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
  r-signal
  r-waveslim
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('46008c91f4ee0d269c7a16078693f47a')
b2sums=('44c116e176d21f2ccb7fc722e7b1efa70587d00e85b420bc39605b2e974d4a83e20db78412a815191d80b701588823d4944719e4f682cf8d36d233a4bc9f8080')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
