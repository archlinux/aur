# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spkTools
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Methods for Spike-in Arrays"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-gtools
  r-rcolorbrewer
)
optdepends=(
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cf470de190004950141bd07cd55e26e2')
b2sums=('2bd662766b39c19e66bf8da3fc4f1eaa586b205bc49efae20648b41219487f1d5cd139e688a3cbcac1a1f74f9979d083dd9edb70fdf7464584a23e992f73497e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
