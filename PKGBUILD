# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fabia
_pkgver=2.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Factor Analysis for Bicluster Acquisition"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.1-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ec8121df5ce33150c60d9031bf4cfe98')
b2sums=('207e347890b30d1d21b59955402ed204d7a3279f983d62e4939f55fe31cb3dbeb110f5969bd82af87e9dbab855f6dd45ed8dfa04db9d78f22cadb20a67e68d47')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
