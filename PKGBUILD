# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lapmix
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Laplace Mixture Model in Microarray Experiments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ea437861e671ec21638fa10ffa4ae5e9')
b2sums=('72c1cc4865ffd87c50810d91f5bad00e5ec926053a04c04ad5806769cb30d650eb06c8d9317c2b78e933d3c222685e84f5194f2bdfac44523eb5ab76f2167117')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
