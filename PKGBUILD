# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AneuFinderData
_pkgver=1.36.0
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
md5sums=('0a7e49261b41216a7c18f3ac974275f9')
b2sums=('1b40396302cc1c8c61dc09b0ebd8c2db65fe3a60534b5bd8d503e29aca278b7d86b1c1a848f6173bf4e6e6a5ada628cb7345fa86b981de34f90b5ed81137b344')

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
