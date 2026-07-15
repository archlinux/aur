# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rhdf5lib
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="hdf5 library as an R package"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
  zlib
)
makedepends=(r-biocmake)
optdepends=(
  r-biocstyle
  r-knitr
  r-mockery
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b8e39f4341e805425d50eb77d77ea3f3')
b2sums=('6d7450b1934455ae6c9db9bd5316398a252b42e282c2519eb731ac774b8c1d2c213b297e10d4e6f98a4a193992b4ba44eb9d6094473f9b9a1cea01f1834da4d3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
