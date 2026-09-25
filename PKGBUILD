# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=fillpattern
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Patterned Fills for 'ggplot2' and 'grid' Graphics"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r-ggplot2
)
optdepends=(
  r-ragg
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('82cc6e512d109d2f1dfdf09fa72493dd')
b2sums=('1ab77a31b5b702c1e54b5173343e84071d98a336c20a7cefffb632909b9ac1d1a7170a6ec2d7ed2fec278bd8aa4247b06dbcc4f8bc59af35d392e9ed14dbfb6f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
