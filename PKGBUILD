# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PLPE
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Local Pooled Error Test for Differential Expression with Paired High-throughput Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-lpe
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('15fbec14fb6549878649e91110dc6c31')
b2sums=('427839d1d8ad84142148ba42efacd2bf5c4de3ac3053b1d0c18489e6016dd0b9c94a9ebcfcd9949408b2af04ed652de66ee7667798aad20cfee04371f0b91964')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
