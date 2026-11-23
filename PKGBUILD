# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rtf
_pkgver=0.4-15
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Rich Text Format ('RTF') Output"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-r.methodss3
  r-r.oo
)
optdepends=(
  r-ggplot2
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f0c0f543503b2dc8c3def05f14fe44d7')
b2sums=('ec4894359e1eebfdefdd1d9bae75dae445bfffd438d118c0fd21d2d03b838e934a8ab352cd7729b708b270e3ae649144e51432ba37e38266889f370ba4d94ebf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
