# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=imageHTS
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Analysis of high-throughput microscopy-based screens"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.1-only')
depends=(
  r-biobase
  r-cellhts2
  r-e1071
  r-ebimage
  r-hwriter
  r-vsn
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('59a274d156e657c237e0ceaff50e0da9')
b2sums=('13a2059a63bdb5f78989f994799faa49d2d7d1dbddbb77c93c3cc6c17f9bd9371f7123a5b0caf38d1bbd9fe97e20691824eb232a36b72ca9c1b91f86715e2bfd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
