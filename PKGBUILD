# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=survivalROC
_pkgver=1.0.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Time-Dependent ROC Curve Estimation from Censored Survival Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f902d8d1d91cbed98b43ca3cfb9cddaa')
b2sums=('b81a3a9b002fe63c793757bfd2f582c1a24257b0731290334c88751e9d03691f56031c87008c28675bb21ecb93c4775f2dd76c6b83411736e729307e2d13e44a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
