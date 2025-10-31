# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MassSpecWavelet
_pkgver=1.76.0
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
md5sums=('222930862724b90388337a655785a01d')
b2sums=('bc8a8f6789dd14dc3e73df8fe55fb7d0755c8748d62e737d3370837f2a7f2a0f1e0643c04261489fb3219a6c51605963e2bd100da4b0ec0f3cf8662470b83832')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
