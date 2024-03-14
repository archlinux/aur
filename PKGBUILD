# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msgps
_pkgver=1.3.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Degrees of Freedom of Elastic Net, Adaptive Lasso and Generalized Elastic Net"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('96879aeb565fb24de9bfd14cd333a2cf')
b2sums=('c6658674d78e2966ca91915988f99a6f5ba9256ea534eb65009961c9308f078519f6994f20fbf04cef5e709e88e11acfcc8fb67533710e35532bdc0db67b77ba')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
