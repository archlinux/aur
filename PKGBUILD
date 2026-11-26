# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=simpIntLists
_pkgver=1.49.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The package contains BioGRID interactions for various organisms in a simple format"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('af339d6a061fcf92b48e123773c813f5')
b2sums=('49c8939ec2da4ae87a55042a55031b40f5fd59eb56600b2ab701f094597063234a36540175426bd8e312eb85204759a9d2bca41460208e0365e0ecd7d5a60b14')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
