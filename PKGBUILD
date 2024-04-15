# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=XML2R
_pkgver=0.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="EasieR XML data collection"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-plyr
  r-rcurl
  r-xml
)
source=("https://cran.r-project.org/src/contrib/Archive/$_pkgname/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2c9f9d3870f9b54c7d89fe9212aee921')
b2sums=('85ea866daff057381f282c5082853e394a6db9f62544dcadf349c18dff59adf053a29976089577d4ff5362257653d3392e0de45d03411185559ca646b3955f8b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
