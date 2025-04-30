# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=poisbinom
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=2
pkgdesc='A Faster Implementation of the Poisson-Binomial Distribution'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  fftw
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fc1a1bf6eb1d9de974e817534cd80b86')
b2sums=('e0f37e3694d234aba0fdfaeaeb59c0d3839214268446f62ab075876f7256e4ac349bc89cab076ae5d5c708694eb308b6b0813c7206690653ca81e8a1a8bf1fa0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
