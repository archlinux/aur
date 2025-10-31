# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterStab
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compute cluster stability scores for microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
optdepends=(
  r-fibroeset
  r-genefilter
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c0dd9cd413cc0ebbd292df747a7cc61a')
b2sums=('14ebadaaa57bef0164a7105f669f26df62a503c82d6ae802e056f6522933dcd6ff1470b38ef3399bc7400310a7fdfd64a56c3aa3c2534b98090f6caf46e57129')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
