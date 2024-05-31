# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spData
_pkgver=2.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Datasets for Spatial Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('CC0-1.0')
depends=(
  r-sp
)
optdepends=(
  r-sf
  r-spatialreg
  r-spdatalarge
  r-spdep
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6cb99dc39a5ef8943f59577bd7cb69c8')
b2sums=('e5b3e59b7bd8a58bbf91bc1a28a1d6a78cdbf7872718f553c8f15e7a38aeebf10068d46b51fb4921f8ec84e127a3c04f3c94d15346c7616e4692ea87845aa517')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
