# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DFP
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Gene Selection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5eb14fe67a6dd0599cd24c3473eec349')
b2sums=('4f1fe36c47a3df3ae473996400d8650e0f3715b715ebb85ddaecf43ff6db63193021715313fe32f0c99320ddac33410e342f6e89e6e9bfa889d1dcbc424d2f29')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
