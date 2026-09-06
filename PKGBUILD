# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmpfr
_pkgver=1.1-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface R to MPFR - Multiple Precision Floating-Point Reliable"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  gmp
  mpfr
  r-gmp
)
optdepends=(
  r-bessel
  r-dpqmpfr
  r-polynom
  r-sfsmisc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0b87d06cb02ade3a14601d3e88637151')
b2sums=('438f711e8f04e52db3f56e2fbcd904cfdcdda71c5ccaf292d5dd4d29deb1d6be01dc5438dcba6dc457b765cc03ce89eb155873c323831883c9a3358d348ac170')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
