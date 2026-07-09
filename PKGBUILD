# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MassSpecWavelet
_pkgver=1.78.2
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
md5sums=('d2e24c33e6b5dd4fb71b875e0c6f21c5')
b2sums=('9d1cd296aebf2cc5b3d070e2a282c967266e2aaf7f5f8759079ddcb4fc3f2b1464e0dc749fd2bc2e1247c92cea6ab1c83a761b777e660e802f7120883fd0415a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
