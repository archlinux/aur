# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmpfr
_pkgver=1.0-0
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
md5sums=('e34f87aff51d2c7e390270fb01172d55')
b2sums=('38b48ba79bcfdb6443caa9c6365216eb7f3a80154d7c90b983f946682aa8f938a7b88e709b2997c3e371e6b9997e3a0e814ee25d3af8646a22e539e8a2ea840d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
