# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ibh
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interaction Based Homogeneity for Evaluating Gene Lists"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-simpintlists
)
optdepends=(
  r-yeastcc
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d48593f196a7750a2bb55ed717b78061')
b2sums=('5e469e02cd4a2c78df83f378e165dc68ea25f7e4e72cfe3e9e7b74c04f7a7e9d46abaa0915f4236ddf85edbb9435952f330bf336b75f09ed4d9ad6b1d3547d03')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
