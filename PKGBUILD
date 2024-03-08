# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=Rspc
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Nelson Rules for Control Charts"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c300edbfe9ca39424c356bdd48e30432')
b2sums=('ffef7ae48fb8740e6cdde8b81e12297f36289f74f3f97d0f38861def71624b5b358bdbb50cda36fb64199484b950b71ef1c783f6d44b97ebb1419e041172c487')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
