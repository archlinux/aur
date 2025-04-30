# system requirements: fftw (>= 3)
# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=poisbinom
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='A Faster Implementation of the Poisson-Binomial Distribution'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5bf9a9a98080c55e1de812c2bce9a082')
b2sums=('9295823ce7473fb96331f3d89c2b03cf1b4077c1af478f615be6cbf6088a748b3b5592d8194a2dd4fa9f5bba1bba7593619c006318454fea111dc8cef13d0b15')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
