# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=poisbinom
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='A Faster Implementation of the Poisson-Binomial Distribution'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  fftw
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fd40c6f7d9c33f6109b1e67516aac534')
b2sums=('efc5767f03642f2202d76c933b74d20ebd319500aefcddbda7522cb616b1ec6e5bfbd2b35589fb2de5c307944f52050918031c33ec5f7b3065932c475aa059c5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
