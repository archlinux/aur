# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AneuFinderData
_pkgver=1.31.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="WGSCS Data for Demonstration Purposes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LicenseRef-AneuFinderData')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0466cfee5aac8efafc6cc96b60f7993f')
b2sums=('db2db6c78e6937b712f11f0b3340d047148de805248c02028ad93324b0e67cfb4eb265f6e0fb563fc91f12e4318667aa846881480f92585a6c14ae5007885faa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
