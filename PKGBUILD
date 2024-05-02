# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bioDist
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Different distance measures"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
optdepends=(
  r-locfit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('eeb9dd18ea8a222dddbfe9a95721ecd7')
b2sums=('51f9c302d13ff8d70e21ed427c18b3392df781161aff123b9b9dd0c20127c530da98a1779e72d8043b27e3508b2c6db314185e7e1df593f8be6aa32bbef4dc03')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
