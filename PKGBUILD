# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MassSpecWavelet
_pkgver=1.80.0
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
  r-signal
  r-testthat
  r-waveslim
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7ba3d2246571cc4aafcce84d16950015')
b2sums=('8fea81d73e3037610026fe2aa155a412013427ed9c031d6f6cb7935bdaf278cdd07f22f06945072ae3821697812a6c0ec387a317e0bfc6a1028be9a69059681f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
