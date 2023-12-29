# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chromstaRData
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="ChIP-seq data for Demonstration Purposes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=(GPL3)
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f4a965a6b5aa71874a5cca39046cabf')
b2sums=('02308ba3c2e2b1ce3c0ee7e7c8d1e371dac61148835ad14d5b84024235ac71d6c0944781f73131bfe875da058a69509171946a4d7ffefe01e69823d01e1c7248')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
