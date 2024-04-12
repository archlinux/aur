# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=GeneralizedHyperbolic
_pkgver=0.8-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="The Generalized Hyperbolic Distribution"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-distributionutils
)
optdepends=(
  r-actuar
  r-runit
  r-skewhyperbolic
  r-variancegamma
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('428dde928d2b3cbdb5b0504aef9c177d')
b2sums=('ebe4200f038f47de718d2dcf6583a5350cc213fb13a8f267b54bdaab6ef1b98b48797e24d220770fa179e2fe2779a939ebfb55b6d2ce175135f226aa47d3561d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
