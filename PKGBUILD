# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COHCAPanno
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotations for City of Hope CpG Island Analysis Pipeline"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('531736c8fb8d2cf0e5a9771669bdcba3')
b2sums=('5893eb758af93f1d10495c069a7089c904cd5d5c1fea1ab387d82f13162b70dc5f4a8f4b987ea0c255cff19b64feeed556880e13d4600a64b2e4fce8867abdca')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
