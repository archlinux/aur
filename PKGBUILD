# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RSEIS
_pkgver=4.2-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Seismic Time Series Analysis Tools"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rpmg
  r-rwave
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1e48488c5c3420d62970461cead4195f')
b2sums=('0e24adf228f9e9d6b6230be1cc57088506911cd6e3983a4e9df869d6862cf3e6b498c74e7581e0678ee9c50c825b745072b792c305a9ae99b711c010a1f48ea3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
