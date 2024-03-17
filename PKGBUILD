# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASEB
_pkgver=1.46.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Predict Acetylated Lysine Sites"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7e9312371523d44d7f1cb759af2d150e')
b2sums=('4619f4135831c148606aa300ca6bdad6b519c03df645250d0aff125d56c495530f3eba035feedad93c555bd07f2cd49d0f9268b0a82f21eef55192d64ace5a28')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
