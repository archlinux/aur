# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=LBE
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Estimation of the false discovery rate"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-qvalue
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('36559f365f1dbd53056e6b43bc1e06e9')
b2sums=('8c10241e146be6fc61c48ba4ac7e6a7b4691c5499a89d920c9b64e7c5a1729a2d3ed5d265a853402b247427fe2ad4e0d8f789bc70fd504695d1673da7006439a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
