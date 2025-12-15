# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmpfr
_pkgver=1.1-2
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
md5sums=('faab8f488c8c7ae0d99595b7eedfc3ad')
b2sums=('3278e8bbdba0eb929eab55d0382396588f2c68d7483e3a2c1a5f862919b2a363e8cb43cc1c95dbebc058d2a648b5cc30820dbb1321ec8eb5485f7a7b991fca6f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
