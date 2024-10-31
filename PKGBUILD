# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chromstaRData
_pkgver=1.31.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ChIP-seq data for Demonstration Purposes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7fc79e419afa2c08fa63cfb84b64f3c8')
b2sums=('489937160cbecafaaa2e1dc8628f5f0306babbc88a782d084eb893849d43fa15f2934e8a40dae7f0a9214c1a577dcc68f64e67d5c3cd22d6e3d5d7cc315166c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
