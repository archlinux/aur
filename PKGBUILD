# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rtf
_pkgver=0.4-14.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Rich Text Format (RTF) Output"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-r.methodss3
  r-r.oo
)
optdepends=(
  r-ggplot2
  r-gsubfn
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b3afa99fabe3b95a92937812db98acbc')
b2sums=('7a4a1c15f4744ca88d3781ae064a2bd7e63cccb534cac955e5485ba551d0b72d2112037d67d56f10b82acb61048cc1bb827e3a346859d29b127a4b3da848fa4d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
