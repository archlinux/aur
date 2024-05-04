# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CopyhelpeR
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Helper files for CopywriteR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c509330cec0cc28372216438a24705ab')
b2sums=('6e248d044d1ebcf84c165b0e0b9ebbaadb4ee3b88a4d3f7d0597308636de85d75fe64cb2e1db48348945047d97114b28dad227904183f15b807694859219c208')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
