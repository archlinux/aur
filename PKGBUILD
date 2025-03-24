# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=psychTools
_pkgver=2.5.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools to Accompany the 'psych' Package for Psychological Research"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-psych
  r-rtf
)
optdepends=(
  r-gparotation
  r-knitr
  r-lavaan
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f40075da5576ab5c2eb448506ae5659')
b2sums=('8efe42c2a7d79b09bdcce1c7b2477497a281e10142d5ec286fc248c83669d7b13c2361ae6b28572919e5318eeae6051a80c475c852c9a72490f47363b3ea1987')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
