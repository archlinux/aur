# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BufferedMatrixMethods
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Microarray Data related methods that utlize BufferedMatrix objects"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-bufferedmatrix
)
optdepends=(
  r-affy
  r-affyio
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('63ef3df515379903325382cdf999e38a')
b2sums=('9ae12950fc309ac8855fcd4e698b8d18061d3fabfb0dbe43b8ae5409081da99c2e0c47dbec4c9ffd72a58cd08aa759458667e47b543acbfdb19479688cfe4f3c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
