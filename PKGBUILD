# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=DistributionUtils
_pkgver=0.6-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Distribution Utilities"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-generalizedhyperbolic
  r-runit
  r-skewhyperbolic
  r-variancegamma
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('07fb4777b695b505d1dc0cfbc65209da')
b2sums=('de6ce23b71e16e7be4f51fc425573a02776fceb6fecaf554ae89ba4fc39e54e9f280d2421b1408ad1acb12e3d06f54608aebb383614dcef3b21c81f08720edbf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
