# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splitstackshape
_pkgver=1.4.8.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Stack and Reshape Datasets After Splitting Concatenated Values"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-data.table
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('381b6593c72b38c503d1629e5ac4f81f')
b2sums=('78cdd85ffd72b26291c1c82bb5ae2f9f4175d4fa0bb1155f8f76c31b587444378cff2fae6055673fc4104e8d53c9fd0f3d10f584cfdaf81083485f755ad27da8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
