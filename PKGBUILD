# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmpfr
_pkgver=0.9-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="R MPFR - Multiple Precision Floating-Point Reliable"
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
  r-polynom
  r-sfsmisc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d20d82b6a05cac1bb46dbd53f82a2d1f')
b2sums=('9431e61a931432b40696fe96b4919a43a166767cc00c0308a4f55e8ca8fa1bddf2212085bbb797a2dd75244d6e7d96185ed89db56004f48138c5c71088ecff6c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
