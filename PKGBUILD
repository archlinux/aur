# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OSAT
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Optimal Sample Assignment Tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biobase
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a074e20f248c79235e4780281c50e59c')
b2sums=('f0da846a370e602ea2afd5b70c8f94e92ab50ed873a4945c1d49520012b4c3afc423471f53932e19537b1f520e1600706863115e1f67cafca90e8080e982e3b2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
