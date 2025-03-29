# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=GeneralizedHyperbolic
_pkgver=0.8-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('a21b05a70270293f5d42aac38f6224c8')
b2sums=('dbe17f4cf716ff6590f3b0541c7e06ffbf7103c7dbb2945ec2670bdc3f04924a43e1872e75b80748debd6e6bd793b7af254fd57a6ece7551c4049c6753620da5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
