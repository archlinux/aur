# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AneuFinderData
_pkgver=1.34.0
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
md5sums=('e003f8236f1f1b4e2c1049ca787bdab2')
b2sums=('5dfedff8dd675f855dccb7dbb367aa2d1d2ba6d0572d7a0b6be5792b63499c6cfc829f94d6a14f6418613d155811068864a71eb63e3efefaac2b4826ff2c30d6')

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
